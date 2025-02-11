pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	property real fixedWidth: 64
	
	required property string base
	required property list<var> colorList // { name, color }[]
	
	padding: "0 15"
	align: "center"
	
	TuiText {
		text: _root.base
		align: "center"
		margin: "0 0 15 0"
	}
	
	Repeater {
		model: _root.colorList
		TuiFlex {
			id: _panel
			required property var modelData
			
			w: _root.fixedWidth
			h: 64
			margin: "4 10"
			shape: "sm"
			shadow: "sm"
			align: "center"
			justify: "center"
			
			property string _color: modelData.color
			colors: TuiContext.themeUtils.createFlatColorset(
				_color, _color, _color, _color, _color, _color,
			)
			
			TuiText {
				text: _panel.modelData.name.replace(_root.base, "")
				colors: "whitetext"
				shadow: "sm"
			}
		}
	}
}
