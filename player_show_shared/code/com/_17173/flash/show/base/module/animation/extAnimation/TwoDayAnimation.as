package com._17173.flash.show.base.module.animation.extAnimation
{
	import com._17173.flash.show.base.module.animation.base.AnimationObject;
	import com._17173.flash.show.base.utils.Utils;
	
	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 *双节礼物效果 
	 * @author zhaoqinghao
	 * 
	 */	
	public class TwoDayAnimation extends AnimationObject
	{
		/**
		 *双节礼物效果 
		 * @author zhaoqinghao
		 * 
		 */	
		public function TwoDayAnimation()
		{
			super();
		}
		
		override protected function otherAction():void{
			if(_actionOk) return;
			var tmc:MovieClip = _mc as MovieClip;
			if(tmc.hasOwnProperty("showInfoMc") && tmc.showInfoMc != null){
				var tmpTf:TextField;
				var showInfo:MovieClip = tmc.showInfoMc;
				if(showInfo && showInfo.sLabel){
					if(showInfo.sLabel){
						tmpTf = showInfo.sLabel as TextField;
						tmpTf.htmlText = getTName();//名字
					}
					if(showInfo.fLabel){
						tmpTf = showInfo.fLabel as TextField;
						tmpTf.width = 215;
						tmpTf.x = 71;
						tmpTf.htmlText = getCName();//数量
					}
				}
			}
		}
		
		private function getTName():String{
			var str:String = "" + Utils.formatToHtml(_data.sName) + "";
			return str;
		}
		
		private function getCName():String{
			var str:String = "<font size='18' color='#FFFFFF'>累计收到" + "<font color='#FFFF00'>" + Utils.formatToHtml(_data.giftCount) + "个</font>"+ _data.giftName + "了</font>";
			return str;
		}
	}
}