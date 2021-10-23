<?php


class Post
{
	protected $gm;
	protected $pdo;
	protected $get;
	protected $auth;


	public function __construct(\PDO $pdo)
	{
		$this->pdo = $pdo;
		$this->gm = new GlobalMethods($pdo);
		$this->get = new Get($pdo);
		$this->auth = new Auth($pdo);
	}

	//insert functions
	public function insert_crew($d)
	{
		// print_r($d);
		$sql = "SELECT * FROM crews_tbl WHERE filename_fld ='$d->filename' LIMIT 1";
		if ($result = $this->pdo->query($sql)->fetchAll()) {
			return array("error" => "Crew Already Exists!");
		} else {

			$sql = "INSERT INTO crews_tbl (fname_fld, mname_fld, lname_fld, rank_fld, filename_fld, isdeleted_fld) VALUES (?, ?, ?, ? , ?, 0)";
			$sql = $this->pdo->prepare($sql);
			$sql->execute([
				$d->fname,
				$d->mname,
				$d->lname,
				$d->rank,
				$d->filename
			]);
			return $this->get->get_clients();
		}
	}

	public function insert_ship($d)
	{
		// print_r($d);
		$sql = "SELECT * FROM ships_tbl WHERE sno_fld ='$d->sno' LIMIT 1";
		if ($result = $this->pdo->query($sql)->fetchAll()) {
			return array("error" => "Ship Already Exists!");
		} else {

			$sql = "INSERT INTO ships_tbl (sno_fld, sname_fld, scompany_fld, sclass_fld, sknot_fld, isdeleted_fld) VALUES (?, ?, ?, ?, ?, 0)";
			$sql = $this->pdo->prepare($sql);
			$sql->execute([
				$d->sno,
				$d->sname,
				$d->scompany,
				$d->sclass,
				$d->sknot,
			]);
			return $this->get->get_ship();
		}
	}

	//update functions
	public function edit_crew($d)
	{	
		$id = $d->id;
		$rank = $d->rank;
		$date = date("Y-m-d H:i:s");

		$sql = "UPDATE crews_tbl SET rank_fld = ?, updatedOn = ? WHERE id= ?";
		$sql = $this->pdo->prepare($sql);
		$sql->execute([
			$rank,
			$date,
			$id
		]);
		return $this->get->get_crew($d->id);
	}

	public function edit_ship($d)
	{	
		$id = $d->sno;
		$sname = $d->sname;
		$date = date("Y-m-d H:i:s");

		$sql = "UPDATE ships_tbl SET sname_fld = ?, updatedOn = ? WHERE sno_fld = ?";
		$sql = $this->pdo->prepare($sql);
		$sql->execute([
			$sname,
			$date,
			$id
		]);
		return $this->get->get_shipiD($id);
	}
	
	public function deactivate_account($d)
	{
		$date = date("Y-m-d H:i:s");

		$res = $this->gm->update('accounts_tbl', array("User_Verified"=>"F", "UpdatedOn"=>$date), "id = '$d'");
		if ($res['code'] != 200) {
			$payload = null;
			$remarks = "failed";
			$message = $res['errmsg'];
			return $this->gm->api_result($payload, $remarks, $message, $res['code']);
		}
		return $this->get->get_accounts();
	}
}
