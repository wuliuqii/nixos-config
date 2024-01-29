import PopupWindow from '../misc/popupWindow.js';
import Applications from 'resource:///com/github/Aylur/ags/service/applications.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { Fzf } from '../../node_modules/fzf/dist/fzf.es.js';
import AppItem from './item.js';
import icons from '../icons.js';

export const WINDOW_NAME = 'launcher';

/**
 * @typedef {import('node_modules/fzf/dist/types/main').Fzf<import('types/widgets/button').default[]>} FzfAppButton
 * @typedef {import('node_modules/fzf/dist/types/main').FzfResultItem<import('types/widgets/button').default>}
 * FzfResultAppButton
 */

const items = [
    ...Applications.list.flatMap(app => Widget.Box({
        attribute: { 'app': app },
        child: Widget.Box({
            vertical: true,
            children: [
                Widget.Separator({ hexpand: true }),
                AppItem(app),
                Widget.Separator({ hexpand: true }),
            ],
        }),
    })),
];

/**
 * @type FzfAppButton
 */
const fzf = new Fzf(items, {
    /**
     * @param {import('types/widgets/box').default} item
     * @returns {string}
     */
    selector: item => item.attribute.app.name,
    tiebreakers: [/** @param {FzfResultAppButton} a, @param {FzfResultAppButton} b*/(a, b) => b.item.attribute.app.frequency - a.item.attribute.app.frequency],
});

/**
 * @param {string} text
 * @param {import('types/widgets/box').default} results
 */
function searchApps(text, results) {
    results.children.forEach(c => results.remove(c));
    const fzfResults = fzf.find(text);
    results.children = fzfResults.map(e => e.item);
}

const SearchBox = () => {
    const results = Widget.Box({
        vertical: true,
    });

    const entry = Widget.Entry({
        hexpand: true,
        primary_icon_name: icons.apps.search,
    })
        .on('notify::text', entry => searchApps(entry.text || '', results))
        .on('activate', () => {
            // @ts-ignore
            results.children[0]?.attribute.app.launch();
            App.closeWindow(WINDOW_NAME);
        })
        .hook(App, (_, name, visible) => {
            if (name !== WINDOW_NAME || !visible)
                return;
            entry.text = '';
            entry.grab_focus();
        }, 'window-toggled');

    return Widget.Box({
        vertical: true,
        children: [
            entry,
            Widget.Scrollable({
                hscroll: 'never',
                child: results,
            }),
        ],
    });
};

export default () => PopupWindow({
    name: WINDOW_NAME,
    transition: 'slide_down',
    child: SearchBox(),
});
