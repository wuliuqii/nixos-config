import App from 'resource:///com/github/Aylur/ags/app.js';
import { timeout } from 'resource:///com/github/Aylur/ags/utils.js';

timeout(1000, () => JSON.stringify(App));

export default (await import('./modules/main.js')).default;
