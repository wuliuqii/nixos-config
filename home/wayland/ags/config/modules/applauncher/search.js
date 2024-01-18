import Applications from 'resource:///com/github/Aylur/ags/service/applications.js';
import AppItem from './appItem.js';
import Fuse from 'node_modules/fuse.js/dist/fuse.basic.min.mjs';

const fuse = new Fuse(Applications.list.map(AppItem), {
    includeScore: true,
    /**
     * @param {import('types/widgets/box').default} item
     */
    keys: [

        'attribute.app.name',
        'attribute.app.description',
        'attribute.app._frequency',
    ],
});
