package com.tocha.controller
{
	import mx.core.FlexGlobals;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import views.QuizView;
	import views.ResultView;
	
	public class QuizCommand extends SimpleCommand implements ICommand
	{
		
		public static const NAME:String = "Quiz";
		public static const SUBMIT:String = NAME + "Submit";
		public static const FORM:String = NAME + "FORM";
		
		override public function execute(notification:INotification):void{
			
			
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch(name){
				case SUBMIT:
					quiz_submit(notification);
					break;
				case FORM:
					show_quiz_form(notification);
					break;
			}
		}
		
		private function quiz_submit(notification:INotification):void{
			trace(notification.getName() + " called.");
			var data:Object = notification.getBody();
			trace("answer1: " + data.answer1 + ", answer2: " + data.answer2+ ", answer3: " + data.answer3);
			
			var score:Number = 0;
			if(data.answer1.toLowerCase() == "i"){
				score++;
			}
			if(data.answer2 == 9){
				score++;
			}	
			if(data.answer3 == "120"){
				score++;
			}
			var user_data:Object = {"username": data.username,"score":score};
			FlexGlobals.topLevelApplication.navigator.pushView(ResultView,user_data);
		}
		
		private function show_quiz_form(notification:INotification):void{
			trace(notification.getName() + " called.");
			FlexGlobals.topLevelApplication.navigator.pushView(QuizView);
		}
		
	}
}