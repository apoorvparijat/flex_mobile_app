package com.tocha
{
	import com.tocha.controller.LoginCommand;
	import com.tocha.controller.QuizCommand;
	import com.tocha.model.UserProxy;
	
	import mx.logging.Log;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
	
	import com.tocha.controller.QuizCommand;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const NAME:String = 'ApplicationFacade';
		public static const LOGIN:String = NAME + 'Login';
		public static const QUIZ:String = NAME + "Quiz";
		
		public static var count:Number = 1;
		
		public static function getInstance():ApplicationFacade{
			trace("Retrieved ApplicationFacade");
			return (instance ? instance : new ApplicationFacade()) as ApplicationFacade;
		}
		
		protected override function initializeController():void{
			super.initializeController();
			
			registerCommand(LOGIN, LoginCommand);
			registerCommand(QuizCommand.SUBMIT, QuizCommand);
			registerCommand(QuizCommand.FORM, QuizCommand);
			registerProxy(new UserProxy());
		}
	}
}