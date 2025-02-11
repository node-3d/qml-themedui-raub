TuiFlex {
	id: _root
	
	justify: "center"
	align: "center"
	
	property int sizeIcon: 0
	property real rotation: 0
	property string name: ""
	property string size: "md" // xxsm xsm sm md lg xlg xxlg
	property string shadowIcon: "none" // "none" | "sm" | "md"
	
	property real _containerSize: TuiContext.getSize(_root.size, "icon")
	property real _glyphSize: TuiContext.getSize(_root.size, "glyph")
	
	w: _containerSize
	h: _containerSize
	
	Binding {
		target: _ld.item
		property: "name"
		value: _root.name
	}
	
	Binding {
		target: _ld.item
		property: "rotation"
		value: _root.rotation
	}
	
	Binding {
		target: _ld.item
		property: "size"
		value: _root.sizeIcon || _root._glyphSize
	}
	
	Binding {
		target: _ld.item
		property: "shadow"
		value: _root.shadowIcon
	}
	
	Binding {
		target: _ld.item
		property: "color"
		value: TuiContext.getColorText(_root.state || null, _root.colors)
	}
	
	Loader {
		id: _ld
		Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
		sourceComponent: TuiContext.iconDelegate
	}
}