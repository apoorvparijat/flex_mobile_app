package com.tocha.controller
{
	import com.tocha.model.UserProxy;
	import mx.core.FlexGlobals;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import views.LoginView;
	import views.QuizView;
	
	public class LoginCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void{
			trace("LoginCommand called.");
			var user_proxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			 
			var data:Object = notification.getBody() as Object;
			trace("Received data: " + data.username + ", " + data.password);
			if(data.password == user_proxy.vo.get_password(data.username)){
				FlexGlobals.topLevelApplication.navigator.pushView(QuizView,data);
			}else{
				trace("Invalid password");
			}
		}
	}
}