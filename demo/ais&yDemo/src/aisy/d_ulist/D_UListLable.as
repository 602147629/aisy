package aisy.d_ulist
{
	import org.aisy.button.Button;
	import org.aisy.ulist.UListEvent;
	import org.aisy.ulist.UListLabel;

	internal class D_UListLable extends UListLabel
	{
		private var _btn:Button;
		
		public function D_UListLable(name:String, data:* = null)
		{
			super(name, data);
			init();
		}
		
		private function init():void
		{
			_btn = new Button();
			_btn.setClassName("ULIST_SKIN_LABEL");
			_btn.dynamic = {mouseEnabled: false};
			_btn.setText("<b>" + iData.name + "</b>");
			addChild(_btn);
			__layout();
		}
		
		private function __layout():void
		{
			if (iData.width) {
				_btn.getSkin().width = iData.width;
				_btn.getTextView().x = (iData.width - _btn.getTextView().width) * 0.5 - 10;
			}
			else {
				_btn.getTextView().x = 5;
				_btn.getSkin().width = _btn.getTextView().width + 30;
			}
		}
		
		override protected function __triggerHandler(type:String, data:* = null):void
		{
			switch (type) {
				case UListEvent.RADIO_SELECT:
					_btn.setText("<b>" + data.name + "</b>");
					__layout();
					break;
			}
			super.__triggerHandler(type, data);
			type = null;
			data = null;
		}
		
		override public function clear():void
		{
			_btn = null;
			super.clear();
		}
		
	}
}