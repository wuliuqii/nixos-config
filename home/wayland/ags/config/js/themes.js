/**
 * A Theme is a set of options that will be applied
 * ontop of the default values. see options.js for possible options
 */
import { Theme, WP, lightColors } from './settings/theme.js';

export default [
    Theme({
        name: 'Catppuccin',
        icon: '󰄛 ',
        'desktop.wallpaper.img': WP + 'evening-sky.png',
        'theme.widget.opacity': 90,
        'desktop.drop_shadow': false,
        'desktop.screen_corners': false,
        'theme.accent.accent': '#b7bdf8',
        'border.width': 2,
        'theme.bg': 'rgba(0,0,0,0.21)',
        'hypr.wm_gaps_multiplier': 1.5,
        'hypr.active_border': '0xfff5bde6',
        'hypr.inactive_border': '0xff24273a',
        'radii': 9,
        'spacing': 4,
        'bar.separators': true,
    }),
];
