TuiFlex {
	id: _root
	
	signal pressed(name: string)
	signal clicked(name: string)
	
	property string name: ""
	property string size: "md"
	property string sizeText: ""
	property string sizeIcons: "md"
	property var icons: null
	property var iconsActive: null
	property string label: ""
	property string labelActive: ""
	property int lines: 0
	property string fontName: "semi"
	property string fontActive: ""
	property int flexText: 0
	property string alignText: ""
	property string shadowText: ""
	property var colorsActive: null
	property bool isActive: false
	property bool isPressable: true
	
	property bool _isHover: _mouse.containsMouse
	property string _sizeIconsFinal: sizeIcons || size
	property bool _isRow: direction.includes("row")
	property bool _isAuto: size === "auto"
	property string _state: (isActive && "active") || (_isHover && "hover") || null
	property var _iconsFinal: isActive ? (iconsActive || icons) : icons
	property string _labelFinal: isActive ? (labelActive || label) : label
	property string _kindFinal: isActive ? (fontActive || fontName) : fontName
	property var _adjustedState: _state === "active" && colorsActive ? null : _state
	property var _iconProps: {
		[0, 1].map(i => {
			if (!_iconsFinal) {
				return null;
			}
			
			const icon = _iconsFinal[i];
			if (!icon) {
				return null;
			}
			
			return Object.assign({}, icon, {
				colors: icon.colors || _root._cachedColors,
				size: icon.size || _sizeIconsFinal,
				state: _adjustedState,
			});
		})
	}
	
	function _processColors() {
		return _root.isActive ? (_root.colorsActive || _root.colors) : _root.colors;
	}
	
	function _processPadding() {
		if (!_isRow || _isAuto) {
			return TuiContext.themeUtils.auxSides(_root.padding);
		}
		
		const splitted = _root.padding ? _root.padding.split(/\s+/) : null;
		if (splitted?.length === 1) {
			return TuiContext.themeUtils.auxSides(`0 ${splitted[0]}`);
		}
		
		return TuiContext.themeUtils.auxSides(_root.padding);
	}
	
	direction: "row"
	justify: "center"
	align: "center"
	shape: "md"
	shadow: "sm"
	colors: "primary"
	state: _adjustedState
	
	h: TuiContext.getSize(_root.size, "button") || -1
	
	data: Item {
		x: 0
		y: 0
		width: 0
		height: 0
		MouseArea {
			id: _mouse
			width: _root.width
			height: _root.height
			hoverEnabled: _root.isPressable
			onPressed: _root.isPressable && _root.pressed(_root.name)
			onClicked: _root.isPressable && _root.clicked(_root.name)
		}
	}
	
	property var _iconLeftProps: _root._iconProps[0] || null
	property var _iconRightProps: _root._iconProps[1] || null
	
	TuiIcon {
		visible: !!_root._iconLeftProps
		sizeIcon: _root._iconLeftProps?.sizeIcon || 0
		rotation: _root._iconLeftProps?.rotation || 0
		name: _root._iconLeftProps?.name || ""
		size: _root._iconLeftProps?.size || "md"
		shadowIcon: _root._iconLeftProps?.shadowIcon || "none"
		state: _root._iconLeftProps?.state || null
		colors: _root._iconLeftProps?.colors || null
	}
	
	TuiText {
		align: _root.alignText || "center"
		flex: _root.flexText
		lines: lines ?? 1
		fontName: _root._kindFinal || "semi"
		size: _root.sizeText || _root.size
		shadow: _root.shadowText
		colors: _root._cachedColors
		state: _root._adjustedState
		text: _root._labelFinal
	}
	
	TuiIcon {
		visible: !!_root._iconRightProps
		sizeIcon: _root._iconRightProps?.sizeIcon || 0
		rotation: _root._iconRightProps?.rotation || 0
		name: _root._iconRightProps?.name || ""
		size: _root._iconRightProps?.size || "md"
		shadowIcon: _root._iconRightProps?.shadowIcon || "none"
		state: _root._iconRightProps?.state || null
		colors: _root._iconRightProps?.colors || null
	}
}