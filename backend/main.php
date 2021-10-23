<?php
	require_once("./config/Config.php");
	require_once("./models/Auth.php");


	$db = new Connection();
	$pdo = $db->connect();

	$get = new Get($pdo);
	$post = new Post($pdo);
	$auth = new Auth($pdo);

	if(isset($_REQUEST['request'])) {
		$req = explode('/', rtrim($_REQUEST['request'], '/'));
	} else {
		$req = array("errorcatcher");
	}
	switch($_SERVER['REQUEST_METHOD']) {
		case 'POST':
			// (base64_decode)
			switch($req[0]) {
				// jd(check_message())
				//AUTH METHOD
				case 'login':
					$d = json_decode(file_get_contents("php://input")); 
					print_r($d);
					echo json_encode($auth->login($d));
				break;

				case 'register':
					$d = json_decode(file_get_contents("php://input")); 

					echo json_encode($auth->register_admin($d));
				break;

				case "changeuserpassword":
					$inData = jd(check_message(file_get_contents("php://input")));
					$d=$inData->load;
					if ($auth->isAuthorized($inData)) {
						echo response($auth->update_userpassword($d));
					} else {
						echo errMsg(401);
					}
				break;
				
				### POST METHODS ###
				case 'insert_crew':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($post->insert_crew($d));
				break; 

				case 'insert_ship':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($post->insert_ship($d));
				break; 

				### EDIT METHODS ###
				case 'update_crew':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($post->edit_crew($d));
				break;

				case 'update_ship':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($post->edit_ship($d));
				break;
				### GET METHODS ###

				case 'get_crew':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($get->get_crew());
				break;


				case 'get_crewById':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($get->get_crew($d));
				break;

				case 'get_ship':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($get->get_ship());
				break;


				case 'get_shipById':
					$d = json_decode(file_get_contents("php://input")); 
					// print_r($d);
					echo json_encode($get->get_shipById($d));
				break;

				case 'getupcomingappointments':
					$inData = jd(check_message(file_get_contents("php://input"))); 
					$d=$inData->load;
					if ($auth->isAuthorized($inData)) {
						echo response($get->get_upcoming(base64_decode($req[1]), base64_decode($req[2]), base64_decode($req[3])));
					} else {
						echo errMsg(401);
					}
					break;

					
				break;
				# End WEB POST Operation
				default:
					echo "no endpoint";
				break;
			}
		break;

		default:
			echo "prohibited";
		break;

	}
?>