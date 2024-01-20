import Applauncher from './applauncher/launcher.js';
import Dashboard from './dashboard/dashboard.js';
import FloatingDock from './dock/floatingDock.js';
import Notifications from './notifications/notifications.js';
import OSD from './osd/osd.js';
import Overview from './overview/overview.js';
import PowerMenu from './powermenu/powerMenu.js';
import QuickSettings from './quicksettings/quickSettings.js';
import ScreenCorners from './screencorner/screenCorners.js';
import TopBar from './bar/topBar.js';
import Verification from './powermenu/verification.js';
import { init } from './settings/setup.js';
import { forMonitors } from './utils.js';
import { initWallpaper } from './settings/wallpaper.js';
import options from './options.js';

initWallpaper();

const windows = () => [
    forMonitors(FloatingDock),
    forMonitors(Notifications),
    forMonitors(OSD),
    forMonitors(ScreenCorners),
    forMonitors(TopBar),
    Applauncher(),
    Dashboard(),
    Overview(),
    PowerMenu(),
    QuickSettings(),
    Verification(),
];

export default {
    onConfigParsed: init,
    windows: windows().flat(1),
    maxStreamVolume: 1.05,
    cacheNotificationActions: false,
    closeWindowDelay: {
        'quicksettings': options.transition.value,
        'dashboard': options.transition.value,
    },
};
