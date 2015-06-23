package com._17173.flash.player.ui.comps.backRecommend
{
	import com._17173.flash.player.ui.comps.backRecommend.data.BackRecItemData;
	
	import flash.display.Sprite;
	
	public class BackRecCenter extends Sprite
	{
		private var _itemW:int = 0;
		private var _itemH:int = 0;
		
		//可以放置item容器的宽高
		private var _sw:int = 0;
		private var _sh:int = 0;
		
		private var _offset:int = 10;
		
		private var _totalNum:int = 0;
		
		private var _dataNum:int = 0;
		
		private var _hn:int = 0;
		
		private var _vn:int = 0;
		
		public function BackRecCenter(width:Number, height:Number)
		{
			super();
			_itemW = 200;
			_itemH = 112;
			_sw = width;
			_sh = height;
			
			initNum();
		}
		
		private function initNum():void
		{
			_hn = int(_sw / _itemW);
			_vn = int(_sh / _itemH);
			_hn = ((_hn * _itemW) + (_hn - 1) * _offset) > _sw ? (_hn - 1) : _hn;
			_vn = ((_vn * _itemH) + (_vn - 1) * _offset) > _sh ? (_vn - 1) : _vn;
			
			_totalNum = _hn * _vn;
		}
		
		public function getTotalNum(value:int):int
		{
			_dataNum = value;
			_totalNum = _totalNum > _dataNum ? _dataNum : _totalNum;
			return _totalNum;
		}
		
		public function setTotalNum(value:int):void
		{
			_totalNum = value;
		}
		
		public function setInfo(value:Array):void
		{
			resize();
			for(var i:int = 0; i < value.length; i++)
			{
				(this.getChildAt(i) as BackRecItem).initData(value[i] as BackRecItemData);
			}
		}
		
		public function resize():void
		{
			if(this.numChildren > 0)
			{
				this.removeChildren(0, this.numChildren - 1);
			}
			
			for(var i:int = 0; i < _vn; i++)
			{
				for(var j:int = 0; j < _hn; j++)
				{
					var item:BackRecItem = new BackRecItem();
					item.width = _itemW;
					item.height = _itemH;
					item.x = _offset * j + _itemW * j;
					item.y = _offset * i + _itemH * i;
					if(this.numChildren >= _totalNum)
					{
						return;
					}
					this.addChild(item);
				}
			}
			
//			this.graphics.clear();
//			this.graphics.beginFill(0x00ff00);
//			this.graphics.drawRect(0,0,width,height);
//			this.graphics.endFill();
		}
		
		override public function get width():Number {
			return _hn * _itemW + _offset * (_hn - 1);
		}
	}
}