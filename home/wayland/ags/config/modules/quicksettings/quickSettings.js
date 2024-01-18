import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Header from './widgets/header.js';
import PopupWindow from '../misc/popupWindow.js';
import { Volume, Microphone, SinkSelector, AppMixer } from './widgets/volume.js';
import { NetworkToggle, WifiSelection } from './widgets/network.js';
import { BluetoothToggle, BluetoothDevices } from './widgets/bluetooth.js';
import { ThemeToggle, ThemeSelector } from './widgets/theme.js';
import { ProfileToggle, ProfileSelector } from './widgets/powerProfile.js';
import Media from './widgets/media.js';
import Brightness from './widgets/brightness.js';
import DND from './widgets/dnd.js';
import MicMute from './widgets/micMute.js';
import options from '../options.js';

const Row = (toggles = [], menus = []) => Widget.Box({
    vertical: true,
    children: [
        Widget.Box({
            class_name: 'row horizontal',
            children: toggles,
        }),
        ...menus,
    ],
});

const Homogeneous = toggles => Widget.Box({
    homogeneous: true,
    children: toggles,
});

export default () => PopupWindow({
    name: 'quicksettings',
    setup: self => self.hook(options.bar.position, () => {
        self.anchor = ['right', options.bar.position.value];
        if (options.bar.position.value === 'top')
            self.transition = 'slide_down';

        if (options.bar.position.value === 'bottom')
            self.transition = 'slide_up';
    }),
    child: Widget.Box({
        vertical: true,
        children: [
            Header(),
            Widget.Box({
                class_name: 'sliders-box vertical',
                vertical: true,
                children: [
                    Row(
                        [Volume()],
                        [SinkSelector(), AppMixer()],
                    ),
                    Microphone(),
                    Brightness(),
                ],
            }),
            Row(
                [Homogeneous([NetworkToggle(), BluetoothToggle()]), DND()],
                [WifiSelection(), BluetoothDevices()],
            ),
            Row(
                [Homogeneous([ProfileToggle(), ThemeToggle()]), MicMute()],
                [ProfileSelector(), ThemeSelector()],
            ),
            Media(),
        ],
    }),
});
