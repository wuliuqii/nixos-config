import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import DateColumn from './dateColumn.js';
import NotificationColumn from './notificationColumn.js';
import PopupWindow from '../misc/popupWindow.js';
import options from '../options.js';

export default () => PopupWindow({
    name: 'dashboard',
    setup: self => self.hook(options.bar.position, () => {
        self.anchor = [options.bar.position.value];
        if (options.bar.position.value === 'top')
            self.transition = 'slide_down';

        if (options.bar.position.value === 'bottom')
            self.transition = 'slide_up';
    }),
    child: Widget.Box({
        children: [
            NotificationColumn(),
            Widget.Separator({ orientation: 1 }),
            DateColumn(),
        ],
    }),
});
