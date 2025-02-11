import ThemedUi
import FontAwesome

IconAwesome {
	property string shadow: "none"
	
	property var _shadowText: TuiContext.getShadowText(shadow)
	style: _shadowText ? _shadowText.style : Text.Normal
	styleColor: _shadowText ? _shadowText.styleColor : "#000000"
}
