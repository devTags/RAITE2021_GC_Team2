<?php
class Get
{
	protected $gm;

	public function __construct(\PDO $pdo)
	{
		$this->pdo = $pdo;
		$this->gm = new GlobalMethods($pdo);
	}

	public function get_crew(){

		$data = [];
		$sql = "SELECT * FROM crews_tbl";

		if ($result = $this->pdo->query($sql)->fetchAll()) {
			foreach ($result as $record) {
				array_push($data, $record);
			}
			return array("data" => $data);
		} else {
			return array("error" => "ERROR: No record found");
		}
	}	


	public function get_crewiD($id){

		$data = [];
		$sql = "SELECT * FROM crews_tbl WHERE id = $d";

		if ($result = $this->pdo->query($sql)->fetchAll()) {
			foreach ($result as $record) {
				array_push($data, $record);
			}
			return array("data" => $data);
		} else {
			return array("error" => "ERROR: No record found");
		}
	}	

	
	public function get_ship(){

		$data = [];
		$sql = "SELECT * FROM ships_tbl";

		if ($result = $this->pdo->query($sql)->fetchAll()) {
			foreach ($result as $record) {
				array_push($data, $record);
			}
			return array("data" => $data);
		} else {
			return array("error" => "ERROR: No record found");
		}
	}	

	public function get_shipiD($id){
		print_r($id);
		// $data = [];
		// $sql = "SELECT * FROM ship WHERE sno_fld = $id ";

		// if ($result = $this->pdo->query($sql)->fetchAll()) {
		// 	foreach ($result as $record) {
		// 		array_push($data, $record);
		// 	}
		// 	return array("data" => $data);
		// } else {
		// 	return array("error" => "ERROR: No record found");
		// }
	}	




	
	public function get_accounts()
	{
		$payload = [];
		$remarks = "success";
		$message = "Successfully retrieved requested data";
		
		$sql = "SELECT accounts_tbl.id, accounts_tbl.User_image, accounts_tbl.User_email, accounts_tbl.User_role, accounts_tbl.CreatedOn, accounts_tbl.UpdatedOn, accounts_tbl.User_Verified, client_tbl.Client_name, doctor_tbl.Doctor_name, doctor_tbl.Doctor_license FROM accounts_tbl LEFT JOIN doctor_tbl ON doctor_tbl.U_id = accounts_tbl.id  
		LEFT JOIN client_tbl ON client_tbl.U_id = accounts_tbl.id WHERE User_role != 'admin'";
		$res = $this->gm->execute_query($sql, "No records found");
		if ($res['code'] == 200) {
			$payload = $res['data'];
		} else {
			$payload = null;
			$remarks = "failed";
			$message = $res['errmsg'];
		}
		// print_r($payload);
		return $this->gm->api_result($payload, $remarks, $message, $res['code']);	
	}
}
