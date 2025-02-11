import * as three from 'three';
import { init, addThreeHelpers } from '3d-core-raub';
import { init as initQml } from '3d-qml-raub';
import { absPath } from 'qml-fontawesome-raub';


const {
	doc, Image: Img, gl, Screen,
} = init({
	isGles3: true,
	isWebGL2: true,
	autoEsc: true,
	autoFullscreen: true,
	title: 'Themed UI',
	width: 1600,
	height: 900,
});
addThreeHelpers(three, gl);

const { QmlOverlay, loop, View } = initQml({ doc, gl, cwd: process.cwd(), three });
View.libs('..'); // i.e. "examples/.." - the root of this repo, where the lib is located
View.libs(absPath);

const icon = new Img('qml.png'); // use `npm start` from "examples", so CWD is there
icon.on('load', () => { doc.icon = (icon as unknown as typeof doc.icon); });

const screen = new Screen({ three });

const overlay = new QmlOverlay({ file: 'qml/gui.qml' });
screen.scene.add(overlay.mesh);

loop(() => screen.draw());
