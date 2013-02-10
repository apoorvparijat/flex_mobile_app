package com.tocha.model
{
	import com.tocha.model.vo.UserVO;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class UserProxy extends Proxy implements IProxy
	{
		
		public static const NAME:String = "UserProxy";
		
		public function UserProxy(proxyName:String=null, data:Object=null)
		{
			trace("Created UserProxy object");
			super(NAME, new UserVO());
		}
		
		public function get vo():UserVO{
			return data as UserVO;
		}
	}
}