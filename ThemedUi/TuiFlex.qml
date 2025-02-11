Item {
	id: _root
	
	default property alias _nested: _grid.data
	
	property string _tuiParentDirection: "column"
	property string _tuiParentJustify: "flex-start"
	property string _tuiParentAlign: "flex-start"
	property var _tuiDebug: null
	
	property var abs: undefined
	property real w: -1
	property real h: -1
	property string shape: "none" // "sm" | "md" | "lg" | "xlg" | "round" + [".top" | ".bottom" | ".left" | ".right"]
	property string border: "none" // "sm" | "md" | "lg" | "xlg"
	property string href: "" // string
	property string direction: "column" // "row" | "column" | "row-rtl" | "column-rtl"
	property string justify: "flex-start" // "flex-start" | "flex-end" | "center" | "stretch"
	property string align: "flex-start" // "flex-start" | "flex-end" | "center" | "stretch"
	property string shadow: "" // "none" | "sm" | "md" | "lg"
	property int flex: 0 // number
	property string padding: "" // css string
	property string margin: "" // css string
	property var colors: "none" // string | {}
	property bool isDisabled: false // boolean
	property real opacityDisabled: 0.4 // number
	property string state: "" // "hover" | "active" | ""
	
	property bool _tuiIsInRow: _tuiParentDirection.includes("row")
	property string _parentAxisX: _tuiIsInRow ? "_tuiParentJustify" : "_tuiParentAlign"
	property string _parentAxisY: _tuiIsInRow ? "_tuiParentAlign" : "_tuiParentJustify"
	property string _parentAlignX: _root[_parentAxisX]
	property string _parentAlignY: _root[_parentAxisY]
	
	property bool _isRtl: _root.direction.includes("rtl")
	property bool _isRow: direction.includes("row")
	property string _axisX: _isRow ? "justify" : "align"
	property string _axisY: _isRow ? "align" : "justify"
	property string _alignX: _root[_axisX]
	property string _alignY: _root[_axisY]
	
	property var _cachedMargins: TuiContext.themeUtils.auxSides(_root.margin)
	Layout.topMargin: _cachedMargins[0]
	Layout.rightMargin: _cachedMargins[1]
	Layout.bottomMargin: _cachedMargins[2]
	Layout.leftMargin: _cachedMargins[3]
	
	Layout.alignment: {
		let align = 0;
		if (_parentAlignX === "flex-start") {
			align |= Qt.AlignLeft;
		}
		if (_parentAlignX === "flex-end") {
			align |= Qt.AlignRight;
		}
		if (_parentAlignX === "center") {
			align |= Qt.AlignHCenter;
		}
		if (_parentAlignY === "flex-start") {
			align |= Qt.AlignTop;
		}
		if (_parentAlignY === "flex-end") {
			align |= Qt.AlignBottom;
		}
		if (_parentAlignY === "center") {
			align |= Qt.AlignVCenter;
		}
		return align;
	}
	
	Layout.fillWidth: {
		if (_root.w > -1) {
			return false;
		}
		if (_root._tuiIsInRow && _root.flex !== 0) {
			return true;
		}
		return _parentAlignX === "stretch";
	}
	Layout.horizontalStretchFactor: {
		if (_root.w > -1) {
			return -1;
		}
		if (_root._tuiIsInRow && _root.flex > 0) {
			return _root.flex;
		}
		return _parentAlignX === "stretch" ? 1 : -1;
	}
	Layout.fillHeight: {
		if (_root.h > -1) {
			return false;
		}
		if (!_root._tuiIsInRow && _root.flex !== 0) {
			return true;
		}
		return _parentAlignY === "stretch";
	}
	Layout.verticalStretchFactor: {
		if (_root.h > -1) {
			return -1;
		}
		if (!_root._tuiIsInRow && _root.flex > 0) {
			return _root.flex;
		}
		return _parentAlignY === "stretch" ? 1 : -1;
	}
	
	function _processColors() {
		return _root.colors;
	}
	function _processPadding() {
		return TuiContext.themeUtils.auxSides(_root.padding);
	}
	property var _cachedColors: _processColors()
	property var _cachedPaddings: _processPadding()
	
	Layout.minimumWidth: {
		if (_root.w > -1) {
			return _root.w;
		}
		if (
			_root._tuiIsInRow && _root.flex !== 0 ||
			!_root._tuiIsInRow && _root._parentAlignX === "stretch"
		) {
			return 0;
		}
		return _grid.childrenRect.width + _cachedPaddings[1] + _cachedPaddings[3];
	}
	Layout.minimumHeight: {
		if (_root.h > -1) {
			return _root.h;
		}
		if (
			!_root._tuiIsInRow && _root.flex !== 0 ||
			_root._tuiIsInRow && _root._parentAlignY === "stretch"
		) {
			return 0;
		}
		return _grid.childrenRect.height + _cachedPaddings[0] + _cachedPaddings[2];
	}
	
	Layout.preferredWidth: {
		if (_root.w > -1) {
			return _root.w;
		}
		return -1;
	}
	Layout.preferredHeight: {
		if (_root.h > -1) {
			return _root.h;
		}
		return -1;
	}
	
	opacity: isDisabled ? opacityDisabled : 1
	
	onDirectionChanged: _grid._realign()
	onAlignChanged: _grid._realign()
	onJustifyChanged: _grid._realign()
	
	data: [
		Item {
			id: _item
			x: 0
			y: 0
			width: 0
			height: 0
			
			property var _radii: TuiContext.getShape(_root.shape)
			
			Rectangle {
				property var _shadow: TuiContext.getShadow(_root.shadow)
				property var _size: _shadow?.size ?? 0
				
				antialiasing: true
				x: -_size + 0.5
				y: -_size + 0.5
				visible: !!_shadow
				width: _root.width + 2 * _size - 1
				height: _root.height + 2 * _size - 1
				color: "transparent"
				border.color: _shadow?.color ?? "black"
				border.width: _size
				topLeftRadius: _item._radii ? _item._radii[0] : undefined
				topRightRadius: _item._radii ? _item._radii[1] : undefined
				bottomRightRadius: _item._radii ? _item._radii[2] : undefined
				bottomLeftRadius: _item._radii ? _item._radii[3] : undefined
			}
			Rectangle {
				width: _root.width
				height: _root.height
				color: TuiContext.getColorBg(_root.state, _root._cachedColors)
				border.color: TuiContext.getColorBorder(_root.state, _root._cachedColors)
				border.width: TuiContext.getBorder(_root.border)
				topLeftRadius: _item._radii ? _item._radii[0] : undefined
				topRightRadius: _item._radii ? _item._radii[1] : undefined
				bottomRightRadius: _item._radii ? _item._radii[2] : undefined
				bottomLeftRadius: _item._radii ? _item._radii[3] : undefined
			}
		},
		Item {
			anchors.fill: parent
			data: _root.abs || []
		},
		GridLayout {
			id: _grid
			
			function _realign() {
				_grid.children.forEach(item => {
					if (typeof item._tuiIsInRow !== "undefined") {
						item._tuiParentDirection = _root.direction;
						item._tuiParentJustify = _root.justify;
						item._tuiParentAlign = _root.align;
					}
				});
			}
			
			onChildrenChanged: _realign()
			
			layoutDirection: _root.direction.includes("rtl") ? Qt.RightToLeft : Qt.LeftToRight
			flow: _root.direction.includes("row") ? GridLayout.LeftToRight : GridLayout.TopToBottom
			
			rowSpacing: 0
			columnSpacing: 0
			
			anchors.top: {
				if ( // qmllint disable Quick.anchor-combinations
					_root._alignY === "flex-start" ||
					_root._alignY === "stretch" ||
					_root._alignY === "center" ||
					(!_root._tuiIsInRow && _root.flex !== 0)
				) {
					return _root.top;
				}
				return undefined;
			}
			anchors.bottom: {
				if (
					_root._alignY === "flex-end" ||
					_root._alignY === "stretch" ||
					_root._alignY === "center" ||
					(!_root._tuiIsInRow && _root.flex !== 0)
				) {
					return _root.bottom;
				}
				return undefined;
			}
			anchors.left: {
				if ( // qmllint disable Quick.anchor-combinations
					(!_root._isRtl && _root._alignX === "flex-start") ||
					(_root._isRtl && _root._alignX === "flex-end") ||
					_root._alignX === "stretch" ||
					_root._alignX === "center" ||
					(_root._tuiIsInRow && _root.flex !== 0)
				) {
					return _root.left;
				}
				return undefined;
			}
			anchors.right: {
				if (
					(!_root._isRtl && _root._alignX === "flex-end") ||
					(_root._isRtl && _root._alignX === "flex-start") ||
					_root._alignX === "stretch" ||
					_root._alignX === "center" ||
					(_root._tuiIsInRow && _root.flex !== 0)
				) {
					return _root.right;
				}
				return undefined;
			}
			
			anchors.topMargin: _root._cachedPaddings[0]
			anchors.rightMargin: _root._cachedPaddings[1]
			anchors.bottomMargin: _root._cachedPaddings[2]
			anchors.leftMargin: _root._cachedPaddings[3]
		}
	]
}