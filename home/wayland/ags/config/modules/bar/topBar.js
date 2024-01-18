import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js';
import Mpris from 'resource:///com/github/Aylur/ags/service/mpris.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import OverviewButton from './buttons/overview.js';
import Workspaces from './buttons/workspaces.js';
import FocusedClient from './buttons/focusedClient.js';
import MediaIndicator from './buttons/mediaIndicator.js';
import DateButton from './buttons/date.js';
import NotificationIndicator from './buttons/notificationIndicator.js';
import SysTray from './buttons/sysTray.js';
import SystemIndicators from './buttons/systemIndicators.js';
import PowerMenu from './buttons/powerMenu.js';
import ColorPicker from './buttons/colorPicker.js';
import ScreenRecord from './buttons/screenRecord.js';
import BatteryBar from './buttons/battery.js';
import SubMenu from './buttons/subMenu.js';
import Recorder from '../services/screenrecord.js';
// import * as System from './buttons/System.js';
// import Taskbar from './buttons/Taskbar.js';
import options from '../options.js';

const submenuItems = Variable(1);
SystemTray.connect('changed', () => {
    submenuItems.setValue(SystemTray.items.length + 1);
});

/**
 * @template {import('types/service').default} T
 * @param {T=} service
 * @param {(service: T) => boolean=} condition
 */
const SeparatorDot = (service, condition) => Widget.Separator({
    vpack: 'center',
    setup: self => {
        const visibility = () => {
            if (!options.bar.separators.value)
                return self.visible = false;

            self.visible = condition && service
                ? condition(service)
                : options.bar.separators.value;
        };

        if (service && condition)
            self.hook(service, visibility);

        self.on('draw', visibility);
        self.bind('visible', options.bar.separators);
    },
});

const Start = () => Widget.Box({
    class_name: 'start',
    children: [
        OverviewButton(),
        SeparatorDot(),
        Workspaces(),
        SeparatorDot(),
        FocusedClient(),
        Widget.Box({ hexpand: true }),
        NotificationIndicator(),
        SeparatorDot(Notifications, n => n.notifications.length > 0 || n.dnd),
    ],
});

const Center = () => Widget.Box({
    class_name: 'center',
    children: [
        DateButton(),
    ],
});

const End = () => Widget.Box({
    class_name: 'end',
    children: [
        SeparatorDot(Mpris, m => m.players.length > 0),
        MediaIndicator(),
        Widget.Box({ hexpand: true }),

        SubMenu({
            items: submenuItems,
            children: [
                ColorPicker(),
                SysTray(),
            ],
        }),

        SeparatorDot(),
        ScreenRecord(),
        SeparatorDot(Recorder, r => r.recording),
        SystemIndicators(),
        SeparatorDot(Battery, b => b.available),
        BatteryBar(),
        SeparatorDot(),
        PowerMenu(),
    ],
});

/** @param {number} monitor */
export default monitor => Widget.Window({
    name: `bar${monitor}`,
    class_name: 'transparent',
    exclusivity: 'exclusive',
    monitor,
    anchor: options.bar.position.bind('value').transform(pos => ([
        pos, 'left', 'right',
    ])),
    child: Widget.CenterBox({
        class_name: 'panel',
        start_widget: Start(),
        center_widget: Center(),
        end_widget: End(),
    }),
});
