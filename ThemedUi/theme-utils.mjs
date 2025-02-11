export const hashIntoColor = (str) => {
	let hash = 0;
	for (let i = 0; i < str.length; i++) {
		// eslint-disable-next-line no-bitwise
		hash = str.charCodeAt(i) + ((hash << 5) - hash);
	}
	let color = '#';
	for (let i = 0; i < 3; i++) {
		// eslint-disable-next-line no-bitwise
		const value = (hash >> (i * 8)) & 0xFF;
		color += value.toString(16).padStart(2, '0');
	}
	return color;
};

const transparentBg = {
	bg: 'transparent',
	bgHover: 'transparent',
	bgActive: 'transparent',
};

const transparentBorder = {
	border: 'transparent',
	borderHover: 'transparent',
	borderActive: 'transparent',
};

export const createFlatColorset = (
	text, textHover, textActive, bg, bgHover, bgActive,
) => Object.assign(
	{
		text,
		textHover,
		textActive,
		bg,
		bgHover,
		bgActive,
	},
	transparentBorder,
);

export const createGhostColorset = (text, textHover, textActive) => Object.assign(
	{
		text,
		textHover,
		textActive,
		border: text,
		borderHover: textHover,
		borderActive: textActive,
	},
	transparentBg,
);

export const createTextColorset = (text, textHover, textActive) => Object.assign(
	{
		text,
		textHover,
		textActive,
	},
	transparentBg,
	transparentBorder,
);

export const createStateColorsetTriplet = (name) => {
	return {
		[name]: createFlatColorset(
			'spec.white',
			'spec.white',
			'spec.white',
			`bg.${name}`,
			`bg.${name}plus`,
			`bg.${name}minus`,
		),
		[`${name}ghost`]: {
			text: `text.${name}`,
			textHover: `text.${name}plus`,
			textActive: `text.${name}minus`,
			bg: 'transparent',
			bgHover: 'transparent',
			bgActive: 'transparent',
			border: `bg.${name}`,
			borderHover: `bg.${name}plus`,
			borderActive: `bg.${name}minus`,
		},
		[`${name}text`]: createTextColorset(
			`text.${name}`,
			`text.${name}plus`,
			`text.${name}minus`,
		),
	};
};

const getShapesForRadius = (radius) => ({
	all: [radius, radius, radius, radius],
	top: [radius, radius, 0, 0],
	bottom: [0, 0, radius, radius],
	left: [radius, 0, 0, radius],
	right: [0, radius, radius, 0],
});

export const mapShapes = (sm, md, lg, xlg) => ({
	round: getShapesForRadius(100),
	sm: getShapesForRadius(sm),
	md: getShapesForRadius(md),
	lg: getShapesForRadius(lg),
	xlg: getShapesForRadius(xlg),
});

export const auxSides = (source) => {
	const splitted = source ? source.split(/\s+/) : null;
	if (!splitted) {
		return [0, 0, 0, 0];
	}
	
	const mapped = splitted.map((v) => ((Number.isNaN(+v) ? v : +v) ?? 0));
	
	if (mapped.length === 1) {
		return [mapped[0], mapped[0], mapped[0], mapped[0]];
	}
	if (mapped.length === 2) {
		return [mapped[0], mapped[1], mapped[0], mapped[1]];
	}
	if (mapped.length === 3) {
		return [mapped[0], mapped[1], mapped[2], mapped[1]];
	}
	
	return mapped;
}

