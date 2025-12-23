let phoneSettings = {
    volume: 0.5,
    silent: false,
    ringtone: 'ringtone'
};

const sounds = {
    message: new Audio('./sounds/message.ogg'),
    ring: new Audio('./sounds/ringtone.ogg'),
    click: new Audio('./sounds/click.ogg'),
    camera: new Audio('./sounds/camera.ogg')
};

for (let s in sounds) {
    sounds[s].volume = phoneSettings.volume;
}

function playSound(type) {
    if (phoneSettings.silent) return;

    if (sounds[type]) {
        sounds[type].currentTime = 0;
        sounds[type].play();
    }
}

function startRingtone() {
    if (phoneSettings.silent) return;
    sounds.ring.loop = true;
    sounds.ring.play();
}

function stopRingtone() {
    sounds.ring.pause();
    sounds.ring.currentTime = 0;
}

function setVolume(v) {
    phoneSettings.volume = v;
    for (let s in sounds) {
        sounds[s].volume = v;
    }
}

function toggleSilent() {
    phoneSettings.silent = !phoneSettings.silent;
}
