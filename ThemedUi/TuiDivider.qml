TuiFlex {
	id: _root
	
	property string size: "sm"
	property bool isVertical: false
	
	colors: "primary"
	
	h: !isVertical ? TuiContext.getSize(_root.size, "divider") || 1 : -1
	w: isVertical ? TuiContext.getSize(_root.size, "divider") || 1 : -1
	
	function _processColors() {
		const normal = TuiContext.getColorText(null, _root.colors);
		const hover = TuiContext.getColorText("hover", _root.colors);
		const active = TuiContext.getColorText("active", _root.colors);
		const newColors = TuiContext.themeUtils.createFlatColorset(
			normal, hover, active, normal, hover, active,
		);
		return newColors;
	}
}