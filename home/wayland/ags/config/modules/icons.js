export default {
    fallback: {
        executable: 'application-x-executable-symbolic',
    },
    audio: {
        mic: {
            muted: 'microphone-sensitivity-muted-symbolic',
            low: 'microphone-sensitivity-low-symbolic',
            medium: 'microphone-sensitivity-medium-symbolic',
            high: 'microphone-sensitivity-high-symbolic',
        },
        volume: {
            muted: 'audio-volume-muted-symbolic',
            low: 'audio-volume-low-symbolic',
            medium: 'audio-volume-medium-symbolic',
            high: 'audio-volume-high-symbolic',
            overamplified: 'audio-volume-overamplified-symbolic',
        },
        type: {
            headset: 'audio-headphones-symbolic',
            speaker: 'audio-speakers-symbolic',
            card: 'audio-card-symbolic',
        },
        mixer: '',
    },
    power: {
        profile: {
            balanced: 'power-profile-balanced-symbolic',
            'power-saver': 'power-profile-power-saver-symbolic',
            performance: 'power-profile-performance-symbolic',
        },
        mode: {
            Integrated: '',
            Hybrid: '󰢮',
        },
    },
    apps: {
        apps: 'view-app-grid-symbolic',
        search: 'folder-saved-search-symbolic',
    },
    battery: {
        charging: '󱐋',
        warning: 'battery-empty-symbolic',
    },
    bluetooth: {
        enabled: 'bluetooth-active-symbolic',
        disabled: 'bluetooth-disabled-symbolic',
    },
    brightness: {
        indicator: 'display-brightness-symbolic',
        keyboard: 'keyboard-brightness-symbolic',
        screen: 'display-brightness-symbolic',
    },
    powermenu: {
        sleep: 'weather-clear-night-symbolic',
        reboot: 'system-reboot-symbolic',
        logout: 'system-log-out-symbolic',
        shutdown: 'system-shutdown-symbolic',
        lock: 'system-lock-screen-symbolic',
    },
    recorder: {
        recording: 'media-record-symbolic',
    },
    notifications: {
        noisy: 'preferences-system-notifications-symbolic',
        silent: 'notifications-disabled-symbolic',
    },
    trash: {
        full: 'user-trash-full-symbolic',
        empty: 'user-trash-symbolic',
    },
    mpris: {
        fallback: 'audio-x-generic-symbolic',
        shuffle: {
            enabled: 'media-playlist-shuffle-symbolic',
            disabled: 'media-playlist-no-shuffle-symbolic',
        },
        loop: {
            none: 'media-playlist-no-repeat-symbolic',
            track: 'media-playlist-repeat-song-symbolic',
            playlist: 'media-playlist-repeat-symbolic',
        },
        playing: 'media-playback-pause-symbolic',
        paused: 'media-playback-start-symbolic',
        stopped: 'media-playback-stop-symbolic',
        prev: 'media-skip-backward-symbolic',
        next: 'media-skip-forward-symbolic',
    },
    ui: {
        colorpicker: 'color-select-symbolic',
        close: 'window-close-symbolic',
        info: 'info-symbolic',
        menu: 'open-menu-symbolic',
        link: 'link-symbolic',
        settings: 'emblem-system-symbolic',
        tick: 'object-select-symbolic',
        arrow: {
            right: 'pan-end-symbolic',
            left: 'pan-start-symbolic',
            down: 'pan-down-symbolic',
            up: 'pan-up-symbolic',
        },
    },
    system: {
        cpu: 'cpu-symbolic',
        ram: 'ram-symbolic',
        temp: 'sensors-temperature-symbolic',
    },
    dialog: {
        Search: '',
        Applauncher: '󰵆',
        Bar: '',
        Border: '󰃇',
        Color: '󰏘',
        Desktop: '',
        Font: '',
        General: '󰒓',
        Miscellaneous: '󰠱',
        Theme: '󰃟',
        Notifications: '󰂚 ',
    },
};
