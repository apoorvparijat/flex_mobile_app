package com.tocha.model.vo
{
	public class UserVO
	{
		
		public var users:Object;
		
		public function UserVO()
		{
			users = new Object();
			users.apoorv = "test";
		}
		
		public function get_password(username:String):String{
			return users[username];
		}
	}
}