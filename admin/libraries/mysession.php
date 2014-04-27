<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
CREATE TABLE `sessions` (
	`sesskey` VARCHAR(64) NOT NULL DEFAULT '',
	`expiry` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`expireref` VARCHAR(250) NULL DEFAULT '',
	`created` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`sessdata` LONGTEXT NULL,
	PRIMARY KEY (`sesskey`),
	INDEX `sess2_expiry` (`expiry`),
	INDEX `sess2_expireref` (`expireref`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;

*/

/**
* @desc SESSION
*/
define("_SESSION_DB",	'codeigniter_214');
define("_SESSION_HOST", 'localhost');
define("_SESSION_USER", 'bill');
define("_SESSION_PASS", 'bill098');

//date_default_timezone_set("Asia/Taipei");
class CI_Mysession {

	var $_link = '';
	var $_session_lifetime = 1800;
	var $_gc_probability = 100; // 1
	var $_gc_divisor 	= 500; // 100
	var $_SESSION_HOST 	= _SESSION_HOST;
	var $_SESSION_DB 	= _SESSION_DB;
	var $_SESSION_USER 	= _SESSION_USER;
	var $_SESSION_PASS 	= _SESSION_PASS;
		
    function __construct() {
		// CSession new 時, 執行的順序為 
		// 1. session -> 2. _open -> 3. _read -> 4. _write -> 5. _open ->  6. _close
	
		# Set up the handler
		session_set_save_handler(
			array(&$this, '_open'), array(&$this, '_close'),  array(&$this, '_read'), 
			array(&$this, '_write'), array(&$this, '_destroy'), array(&$this, '_gc')
		);
		
		ini_set('session.cookie_lifetime', 0);
	
		if ($this->_gc_probability)
			ini_set('session.gc_probability', $this->_gc_probability);

		if ($this->_gc_divisor)
			ini_set('session.gc_divisor', $this->_gc_divisor);			
		
		if ($this->_session_lifetime)
			ini_set('session.gc_maxlifetime', $this->_session_lifetime);

		if (isset($_COOKIE['PHPSESSID']) and $_COOKIE['PHPSESSID'] != NULL) {
            session_id($_COOKIE['PHPSESSID']);
			@session_start();
        } else {
			@session_start();

            $set_sid = session_id();  
            if(!isset($_COOKIE_LIFETIME)) $_COOKIE_LIFETIME=3600; // 一小時 default: 3600
            setcookie("PHPSESSID", $set_sid, time()+$_COOKIE_LIFETIME,"/","."._SESSION_DOMAIN); 
        }
		// start the session
		//@session_start();
    }

    /**
     *  close
     */
    function _close() {
		mysql_close($this->_link);
        return true;
    }

    /**
     *  destroy
     */
    function _destroy($session_id) {
		$this->_open();
		$sql = "DELETE FROM sessions WHERE sesskey = '".$session_id."'";
		$qid = mysql_query($sql, $this->_link);
		return $qid;
    }

    /**
     *  gc
     */
    function _gc() {
		$this->_open();
		//$sql = "DELETE FROM sessions WHERE expiry < '" . date("Y-m-d H:i:s", time()) . "'";
		$sql = "DELETE FROM sessions WHERE expiry < ".time();
		mysql_query($sql, $this->_link);
    }

    /**
     *  open
     */
    function _open() {
		$this->_link = mysql_connect($this->_SESSION_HOST, $this->_SESSION_USER, $this->_SESSION_PASS,true) 
			or die("Can't connect to " . $this->_SESSION_HOST . " MySQL Error: " . mysql_error());

		if (!$this->_link) {
			die('Could not connect: ' . mysql_error());
		}

		$db_selected = mysql_select_db($this->_SESSION_DB, $this->_link);

		if (!$db_selected) {
			//echo "Unable to select session database ".$this->_SESSION_DB;
			//exit;
			die('Can\'t use '.$this->_SESSION_DB.' : '.mysql_error());
		}

		mysql_query("SET character_set_client = utf8", $this->_link) or die("Invalid query: ".mysql_error());
		mysql_query("SET character_set_results = utf8", $this->_link);
		mysql_query("SET character_set_connection = utf8", $this->_link);
        return true;
    }

    /**
     * read
     */
    function _read($session_id) {
		$sql = "SELECT sessdata FROM sessions WHERE sesskey = '" . $session_id . "' AND expiry > '" . date("Y-m-d H:i:s", time() ) . "' LIMIT 1";
		$iRs = mysql_query($sql, $this->_link);
        $fields = @mysql_fetch_assoc($iRs);
		
		return $fields['sessdata'];
    }

    /**
     *  write
     */
    function _write($session_id, $session_data) {
		$this->_open();
		
        // $sql = "INSERT INTO sessions 
					// SET sesskey	= '" . $session_id . "', 
						// sessdata	= '" . $session_data . "',
						// expiry		= '" . date("Y-m-d H:i:s", time() + $this->_session_lifetime ) . "',
						// created		= '" . date("Y-m-d H:i:s", time() ) . "',
						// modified	= '" . date("Y-m-d H:i:s", time() ) . "'
					// ON DUPLICATE KEY UPDATE
						// sessdata	= '" . $session_data . "',
						// modified	= '" . date("Y-m-d H:i:s", time() ) . "',
						// expiry		= '" . date("Y-m-d H:i:s", time() + $this->_session_lifetime ) . "'";
		//$iRs = mysql_query($sql, $this->_link);
		
		$expiry		= date("Y-m-d H:i:s", time() + $this->_session_lifetime);
		$created	= date("Y-m-d H:i:s", time() );
		// 判斷是否有大於目前的時間 session 值
		$query1 = mysql_query("SELECT COUNT(sesskey) as total FROM sessions WHERE sesskey = '$session_id' AND expiry > " . time(), $this->_link);
		$aRow1 = mysql_fetch_assoc($query1);
		
		if ($aRow1['total'] == 0) {
			mysql_query("DELETE FROM sessions WHERE sesskey = '$session_id'", $this->_link);
			// 新增 使用者資訊
			$qry = "INSERT INTO sessions(sesskey,expiry,sessdata,created,modified) VALUES ('$session_id', '$expiry', '$session_data', '$created', '$created')";
			$iRs = mysql_query($qry, $this->_link);
		} else {
			// 如果有就更新資料
			$qry = "UPDATE sessions SET modified = '$created', expiry = '$expiry', sessdata = '$session_data' WHERE sesskey = '$session_id' AND expiry > " . time();
			$iRs = mysql_query($qry, $this->_link);
		}
		
        return $iRs;
    }

	function get_settings() {
		// get the settings
        $gc_maxlifetime = ini_get('session.gc_maxlifetime');
        $gc_probability = ini_get('session.gc_probability');
        $gc_divisor     = ini_get('session.gc_divisor');

        // return them as an array
        return array(
            'session.gc_maxlifetime'    =>  $gc_maxlifetime . ' seconds (' . round($gc_maxlifetime / 60) . ' minutes)',
            'session.gc_probability'    =>  $gc_probability,
            'session.gc_divisor'        =>  $gc_divisor,
            'probability'               =>  $gc_probability / $gc_divisor * 100 . '%',
        );
    }
	
	function regenerate_id() {
        $old_session_id = session_id();
        session_regenerate_id();
        $this->_destroy($old_session_id);
    }

    function destroy() {
		@session_start();
        session_destroy();
    }
	
	function set($key, $val) {
		$_SESSION[$key] = $val;
	}
	
	function sess_unset() {
		session_unset();
	}
	
	function get($key) {
		return isset($_SESSION[$key])?$_SESSION[$key]:null;
	}
	
}

?>