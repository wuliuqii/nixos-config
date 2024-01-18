import App from 'resource:///com/github/Aylur/ags/app.js';
import Clock from '../../misc/clock.js';
import PanelButton from '../panelButton.js';

export default ({ format = '%H:%M - %A %e.' } = {}) => PanelButton({
    class_name: 'dashboard panel-button',
    on_clicked: () => App.toggleWindow('dashboard'),
    window: 'dashboard',
    content: Clock({ format }),
});
