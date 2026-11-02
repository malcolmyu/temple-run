import {startupMark} from './game/startupTiming';
import { createApp } from 'vue';
import App from './ui/App.vue';
import './ui/ui.css';

startupMark('app-module-executed');
createApp(App).mount('#app');

import './ui/runtime-assets.generated.css';
