pragma Singleton

import "./default-theme.js" as DefaultTheme
import "./theme-getters.js" as ThemeGetters
import "./theme-utils.mjs" as ThemeUtils


QtObject {
	id: _root
	
	readonly property var themeUtils: ThemeUtils
	readonly property var defaultTheme: DefaultTheme.defaultTheme
	property var theme: DefaultTheme.defaultTheme
	
	function getShape(name) {
		return ThemeGetters.getThemeShape(_root.theme, name);
	}
	function getBorder(name) {
		return ThemeGetters.getThemeBorder(_root.theme, name) || 0;
	}
	function getSize(name, prefix) {
		return ThemeGetters.getThemeSize(_root.theme, name, prefix) || 42;
	}
	function getFont(name) {
		return ThemeGetters.getThemeFont(_root.theme, name);
	}
	function getShadow(name) {
		return ThemeGetters.getThemeShadow(_root.theme, name);
	}
	function getShadowText(name) {
		return ThemeGetters.getThemeShadowText(_root.theme, name);
	}
	function getColor(name) {
		return ThemeGetters.getThemeColor(_root.theme, name) || "#ff0000";
	}
	function getColorBg(state, colors) {
		return ThemeGetters.getThemeColorSet(_root.theme, 'bg', state, colors) || "#ff0000";
	}
	function getColorText(state, colors) {
		return ThemeGetters.getThemeColorSet(_root.theme, 'text', state, colors) || "#ff0000";
	}
	function getColorBorder(state, colors) {
		return ThemeGetters.getThemeColorSet(_root.theme, 'border', state, colors) || "#ff0000";
	}
	
	property Component iconDelegate: FakeIcon {}
	
	// property var icons: QtObject {
	// 	property Component caretDown: FakeIcon { name: "caretDown" }
	// 	property Component radioOn: FakeIcon { name: "radioOn" }
	// 	property Component radioOff: FakeIcon { name: "radioOff" }
	// 	property Component checkboxOn: FakeIcon { name: "checkboxOn" }
	// 	property Component checkboxOff: FakeIcon { name: "checkboxOff" }
	// 	property Component switchHandle: FakeIcon { name: "switchHandle" }
	// }
	
	property var textAligns: QtObject {
		property int left: Text.AlignLeft
		property int right: Text.AlignRight
		property int center: Text.AlignHCenter
		property int justify: Text.AlignJustify
	}
	
	property var flexAligns: QtObject {
		property int left: Qt.AlignLeft
		property int hCenter: Qt.AlignHCenter
		property int right: Qt.AlignRight
		property int top: Qt.AlignTop
		property int vCenter: Qt.AlignVCenter
		property int bottom: Qt.AlignBottom
		property int baseline: Qt.AlignBaseline
	}
}