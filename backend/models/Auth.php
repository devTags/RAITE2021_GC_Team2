<?php  
	class Auth {
		protected $pdo; 
		protected $gm;

		public function __construct(\PDO $pdo) {
			$this->gm = new GlobalMethods($pdo);
			$this->pdo = $pdo;
		}

		
		########################################
		# 	USER AUTHORIZATION RELATED METHODS
		########################################
		
		protected function generateHeader() {
			$h=[
				"typ"=>"JWT",
				"alg"=>'HS256',
				"app"=>"GC_Team2",
				"dev"=>"Tagle, Gerald B., Lorenzo Mora"
			];
			return str_replace(['+','/','='],['-','_',''], base64_encode(json_encode($h)));
		}
		
		
		protected function generatePayload($uc, $ue, $ito) {
			$p = [   
				'uc'=>$uc,
				'ue'=>$ue,
				'ito'=>$ito,
				'iby'=>'Tagle, Gerald B.',
				'ie'=>'GC_Team2@gmail.com',
				'idate'=>date_create()
			];
			return str_replace(['+','/','='],['-','_',''], base64_encode(json_encode($p)));
		}

		protected function generateToken($code, $course, $fullname) {
			$header = $this->generateHeader();
			$payload = $this->generatePayload($code, $course, $fullname);
			$signature = hash_hmac('sha256', "$header.$payload", "www.gordoncollege.edu.ph");
			return str_replace(['+','/','='],['-','_',''], base64_encode($signature));
		}

		public function isAuthorized($dt) {
			// print_r($dt);
			$authUser = $dt->userid;
			$authHeader = $dt->token;
			$sql = "SELECT id, User_token FROM accounts_tbl WHERE id='$authUser'";
			$res = $this->gm->execute_query($sql, "Unauthorized User");
			if($res['code'] == 200) {
				if ($res['data'][0]['User_token']==$authHeader) { return true; }
			}
			return false;
		}

		########################################
		# 	USER AUTHENTICATION RELATED METHODS
		########################################

		public function encrypt_password($pword) {
			$hashFormat="$2y$10$";
			$saltLength=22;
			$salt=$this->generate_salt($saltLength);
			return crypt($pword, $hashFormat.$salt);
		}

		protected function generate_salt($len) {
			$urs=md5(uniqid(mt_rand(), true));
			$b64String = base64_encode($urs);
			$mb64String = str_replace('+', '.', $b64String);
			return substr($mb64String, 0, $len);
		}

		public function pword_check($pword, $existingHash) {
			$hash=crypt($pword, $existingHash);
			if($hash===$existingHash) {
				return true;
			} 
			return false;
		}
		
		public function login($param){
			// print_r($param->username);
			$un = $param->username;
			$pw = $param->password;
			$payload = "";
			$remarks = "";
			$message = "";
			$ispwordtochange = 0;
			$code = 403;

			$sql = "SELECT * FROM accounts_tbl WHERE username_fld ='$un' AND role_fld = '1' LIMIT 1";

			$res = $this->gm->execute_query($sql, "Incorrect username or password");
			if($res['code'] == 200) {
				if($this->pword_check($pw, $res['data'][0]['password_fld'])) {
					$id = $res['data'][0]['id'];
					$user_role = $res['data'][0]['role_fld'];
					$user_email = $res['data'][0]['emailadd_fld'];
					$user_name = $res['data'][0]['username_fld'];
			
				
					if($user_role == 1	){
						$tk = $this->generateToken($user_role, $user_email, $user_name);
						$sql = "UPDATE accounts_tbl SET token_fld ='$tk' WHERE id = '$id'";
						$this->gm->execute_query($sql, "");
	
						$code = 200;
						$remarks = "success";
						$message = "Logged in successfully";
						$payload = array("id"=>$id, "username"=>$user_name, "email"=>$user_email, "role"=>$user_role ,"key"=>$tk);
						
					}else{
						$payload = null; 
						$remarks = "failed"; 
						$message = "Incorrect username or password";
					}
				} else {
					$payload = null; 
					$remarks = "failed"; 
					$message = "Incorrect username or password";
				}
			}	else {
				$payload = null; 
				$remarks = "failed"; 
				$message = $res['errmsg'];
			}
			// print_r($this->gm->api_result($payload, $remarks, $message, $code));
			return $this->gm->api_result($payload, $remarks, $message, $code);
		}

		public function update_userpassword($d) {
			$oldpw = $d->data->oldpw;
			$newpw = $d->data->newpw;

			$sql = "SELECT * FROM accounts_tbl WHERE id='$d->id' AND isdeleted=0 LIMIT 1";
			$res = $this->gm->execute_query($sql, "Incorrect username or password");

			if($res['code'] == 200) {
				
				if($this->pword_check($oldpw, $res['data'][0]['User_password'])) {
					$sqlstr = "UPDATE accounts_tbl set User_password=?, User_passwordchanged=? WHERE id=?";

					$sql = $this->pdo->prepare($sqlstr);
					$sql->execute([$this->encrypt_password($newpw), 1, $d->id]);

					$payload = null;
					$remarks = "success";
					$message = 'Successfully updated record';
					return $this->gm->api_result($payload, $remarks, $message, 200);
				} else {
					$payload = null;
					$remarks = "failed";
					$message = 'Old Password incorrect';
					return $this->gm->api_result($payload, $remarks, $message, 401);
				}
			} else {
				$payload = null;
				$remarks = "failed";
				$message = $res['errmsg'];
				return $this->gm->api_result($payload, $remarks, $message, 401);
			}

		}

		// public function admin_login($param) {
		// 	$un = $param->param1;
		// 	$pw = $param->param2;
			
		

		// public function login($d) {
		// 	$un = $d->username;
		// 	$pw = $d->password;
		
				
		// 		$sql = "SELECT * FROM accounts_tbl  WHERE User_username = '$un'  OR User_email = '$un' AND isVerified = 'T' LIMIT 1";
		// 		try {
		// 			if($res = $this->pdo->query($sql)->fetchAll()) {
		// 				if($this->pword_check($pw, $res[0]['User_password'])) 
		// 				{
		// 					return array("data"=>array("id"=>$res[0]['id'], "User_username"=>$res[0]['User_username'], "User_image"=>$res[0]['User_image'], "User_role"=>$res[0]['User_role']));
	
		// 				} else {
	
		// 					exit();
		// 					return array("error"=>"Incorrect username or password");
		// 				} 
		// 			} else {
	
		// 				exit();
		// 				return array("error"=>"Incorrect username or password");
		// 			} 
		// 			} catch (PDOException $error) {
		// 				echo 'Connection failed: ' .$error->getMessage();
		// 		}
		// 	}
		

		public function register_admin($d) {
			// print_r($d);
			// $sql = "SELECT * FROM clinicord_accounts WHERE Doctor_email='$d->email' OR Doctor_username='$d->username' LIMIT 1";
			$sql = "SELECT * FROM accounts_tbl WHERE emailadd_fld ='$d->email' OR username_fld='$d->username' LIMIT 1";

			try {
				if($result = $this->pdo->query($sql)->fetchAll()) {
							return array("error"=>"Failed Registered");
							} else {
			   
						   $sql = "INSERT INTO accounts_tbl (username_fld, emailadd_fld, password_fld, role_fld) VALUES (?, ?, ?, ?)";
						   $sql = $this->pdo->prepare($sql);
						   
						   $sql->execute([
							   $d->username,
							   $d->email,
							   $this->encrypt_password($d->password),
							   $d->role
						   ]);
					   return array("success"=>"Sucessfully Registered");
					}
			   
				} catch (PDOException $error) {
				echo 'Connection failed: ' .$error->getMessage();
			}
			
		}

		public function client_registration($d) {
			print_r($d->username);
		
			// $sql = "SELECT * FROM accounts_tbl WHERE User_email='$d->email' OR User_username='$d->username' LIMIT 1";
			// try {
			// 	if($result = $this->pdo->query($sql)->fetchAll()) {
			// 		return array("error"=>"Failed Registered");
			// 		} else {
	   
			// 	   $sql = "INSERT INTO accounts_tbl (User_username, User_email, User_password, User_image) VALUES (?, ?, ?, ?)";
			// 	   $sql = $this->pdo->prepare($sql);
				   
			// 	   $sql->execute([
			// 		   $d->username,
			// 		   $d->email,
			// 		   $this->encrypt_password($d->password),
			// 		   $d->image
			// 	   ]);
			// 		}
					//    $last_id = $this->pdo->lastInsertId();
					//    $isdeleted = 'F';
					//    $sql = "INSERT INTO 
					//    client_tbl ( U_id, Client_name, Client_gender, Client_age, Client_birthdate, Client_address, Client_phone, Client_weight, Client_height, Client_bloodtype, Client_healthcondition, Client_healthsymptoms, Client_healthmedication, Client_healtallergies, Client_healthtobacco, Client_drughistory, Client_alcoholhistory, IsDeleted) 
					//    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					//    $sql = $this->pdo->prepare($sql);
					//    $sql->execute([
					// 	   $last_id,
					// 	   $d->name,
					// 	   $d->gender,
					// 	   $d->age,
					// 	   $d->birthdate,
					// 	   $d->address,
					// 	   $d->phone,
					// 	   $d->weight,
					// 	   $d->height,
					// 	   $d->bloodtype,
					// 	   $d->condition,
					// 	   $d->symptoms,
					// 	   $d->medication,
					// 	   $d->allergy,
					// 	   $d->tobacco,
					// 	   $d->drug,
					// 	   $d->alcohol,
					// 	   $isdeleted
					//    ]);
				// 	   return array("success"=>"Sucessfully Registered");
				// 		}
				// 	catch (PDOException $error) {
				// 	echo 'Connection failed: ' .$error->getMessage();
				// }
			}
		}
	?>
