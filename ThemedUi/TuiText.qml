Text {
	id: _root
	
	property string _tuiParentDirection: "column"
	property string _tuiParentJustify: "flex-start"
	property string _tuiParentAlign: "flex-start"
	property var _tuiDebug: null
	
	property int lines: 0
	property string size: "md" // xxsm xsm sm md lg xlg xxlg
	property string fontName: "regular"
	property string align: "left" // "left" | "right" | "center" | "justify"
	property string shadow: "none" // "none" | "sm" | "md"
	property int flex: 0
	property string padding: "" // css string
	property string margin: "" // css string
	property var colors: "primarytext" // string | {}
	property bool isDisabled: false
	property real opacityDisabled: 0.4
	property string state: "" // "hover" | "active" | ""
	
	font.family: TuiContext.getFont(_root.fontName)?.family ?? ""
	font.weight: TuiContext.getFont(_root.fontName)?.weight ?? Font.Normal
	font.pixelSize: TuiContext.getSize(_root.size, "font")
	
	property var _cachedPaddings: TuiContext.themeUtils.auxSides(_root.padding)
	topPadding: _cachedPaddings[0]
	rightPadding: _cachedPaddings[1]
	bottomPadding: _cachedPaddings[2]
	leftPadding: _cachedPaddings[3]
	
	property var _cachedMargins: TuiContext.themeUtils.auxSides(_root.margin)
	Layout.topMargin: _cachedMargins[0]
	Layout.rightMargin: _cachedMargins[1]
	Layout.bottomMargin: _cachedMargins[2]
	Layout.leftMargin: _cachedMargins[3]
	
	Layout.fillWidth: _root.flex !== 0
	Layout.horizontalStretchFactor: _root.flex || -1
	Layout.verticalStretchFactor: -1
	
	property bool _tuiIsInRow: _tuiParentDirection.includes("row")
	property string _parentAxisX: _tuiIsInRow ? "_tuiParentJustify" : "_tuiParentAlign"
	property string _parentAxisY: _tuiIsInRow ? "_tuiParentAlign" : "_tuiParentJustify"
	property string _parentAlignX: _root[_parentAxisX]
	property string _parentAlignY: _root[_parentAxisY]
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
	
	color: TuiContext.getColorText(_root.state || null, _root.colors)
	opacity: isDisabled ? opacityDisabled : 1
	horizontalAlignment: TuiContext.textAligns[_root.align]
	maximumLineCount: _root.lines > 0 ? _root.lines : 9999
	elide: Text.ElideRight
	wrapMode: Text.WordWrap
	
	property var _shadowText: TuiContext.getShadowText(_root.shadow)
	style: _shadowText ? _shadowText.style : Text.Normal
	styleColor: _shadowText ? _shadowText.styleColor : "#000000"
	
	text: ""
}