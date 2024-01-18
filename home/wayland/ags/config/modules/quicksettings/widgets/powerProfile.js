import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import PowerProfiles from 'resource:///com/github/Aylur/ags/service/powerprofiles.js';
import icons from '../../icons.js';
import { ArrowToggleButton, Menu } from '../toggleButton.js';

export const ProfileToggle = () => ArrowToggleButton({
    name: 'power-profile',
    icon: Widget.Icon({
        icon: PowerProfiles.bind('icon_name'),
    }),
    label: Widget.Label({
        label: PowerProfiles.bind('active_profile'),
    }),
    connection: [PowerProfiles, () => PowerProfiles.active_profile !== 'balanced'],
    activate: () => { PowerProfiles.active_profile = 'performance'; },
    deactivate: () => { PowerProfiles.active_profile = 'power-saver'; },
    activateOnArrow: false,
});

export const ProfileSelector = () => Menu({
    name: 'power-profile',
    icon: Widget.Icon({
        icon: PowerProfiles.bind('icon_name'),
    }),
    title: Widget.Label('Profile Selector'),
    content: [
        Widget.Box({
            vertical: true,
            hexpand: true,
            children: [
                Widget.Box({
                    vertical: true,
                    children: ['power-saver', 'balanced', 'performance'].map(prof => Widget.Button({
                        on_clicked: () => { PowerProfiles.active_profile = prof; },
                        child: Widget.Box({
                            children: [
                                Widget.Icon(icons.power.profile[prof]),
                                Widget.Label(prof),
                            ],
                        }),
                    })),
                }),
            ],
        }),
    ],
});
