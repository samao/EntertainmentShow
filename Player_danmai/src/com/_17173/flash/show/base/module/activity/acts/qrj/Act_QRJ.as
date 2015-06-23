package com._17173.flash.show.base.module.activity.acts.qrj
{
	import com._17173.flash.show.base.module.activity.ActivityType;
	import com._17173.flash.show.base.module.activity.base.ActivityRankBase;
	import com.greensock.TweenLite;
	
	import flash.events.MouseEvent;
	
	public class Act_QRJ extends ActivityRankBase
	{
		public function Act_QRJ()
		{
			super(ActivityType.ACT_214);
			this.x = 500;
			this.y = 480;
		}
		
		override public function get actName():String
		{
			return super.actName;
		}
		
		override public function set actName(name:String):void
		{
			super.actName = name;
		}
		
		override protected function listBack(data:Object):void
		{
			super.onSocket(data);
			var data:Object = data.ct;
			setupData(data);
		}
		
		override protected function recZCountBack(data:Object):void{
			var count:Object = data.ct;
			if(_rank){
				ACT_Rank_QRJ.rCount = count.longJieCount ;
				ACT_Rank_QRJ.sCount = count.fengJieCount ;
				this._rank.updateCount();
			}
		}
		
		
		override protected function initRank():void
		{
			// TODO Auto Generated method stub
			super.initRank();
			_rank = new ACT_Rank_QRJ(toSub);
			_rank.y = -200;
			_rank.x = -20;
		}
		
		override protected function initSub():void
		{
			// TODO Auto Generated method stub
			super.initSub();
			_sub = new Act_showmc_qrj();
			_sub.mouseChildren = false;
			_sub.buttonMode = true;
			_sub.addEventListener(MouseEvent.CLICK,toRank);
		}
		
		override protected function showRankEffect():void{
			super.showRankEffect();
			_rank.y = -200;
			TweenLite.to(_rank,.3,{y:-310});
		}
		
	}
}