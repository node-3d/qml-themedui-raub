
const getNested = (source, path) => {
	if (!path) {
		return null;
	}
	const pathSegments = path.split('.');
	const count = pathSegments.length;
	
	if (!count) {
		return undefined;
	}
	
	if (count === 1) {
		return source[path];
	}
	
	if (count === 2) {
		const segment0 = pathSegments[0] ?? '';
		const nest1 = source[segment0];
		if (!nest1 || typeof nest1 !== 'object') {
			return undefined;
		}
		
		const segment1 = pathSegments[1] ?? '';
		return nest1[segment1];
	}
	
	let value = source;
	
	for (let i = 0; i < pathSegments.length; i++) {
		const segment = pathSegments[i] || '';
		if (!value || typeof value !== 'object') {
			return undefined;
		}
		value = value[segment];
	}
	
	return value;
};

const getThemeShape = (theme, name) => getNested(theme.shapes, name.includes('.') ? name : `${name}.all`);

const getThemeBorder = (theme, name) => getNested(theme.borders, name);

const getThemeSize = (theme, name, prefix) => getNested(theme.sizes, name.includes('.') ? name : `${prefix}.${name}`);

const getThemeFont = (theme, name) => getNested(theme.fonts, name);

const getThemeShadow = (theme, name) => getNested(theme.shadows, name);

const getThemeShadowText = (theme, name) => getNested(theme.shadowsText, name);

const getThemeColor = (theme, name) => getNested(theme.colors, name);

const getThemeColorSet = (theme, name, state, colors) => {
	const colorSets = theme.colorSets;
    const finalColorset = (
        typeof colors === 'string'
            ? colorSets[colors] || colorSets.primary
            : colors || colorSets.primary
    );
    
    const key = (
        (state === 'active' && `${name}Active`) ||
        (state === 'hover' && `${name}Hover`) ||
        name
    );
    const color = finalColorset[key];
    
    return getThemeColor(theme, color) || color;
};
