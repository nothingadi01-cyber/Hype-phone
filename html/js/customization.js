let settings = {
    theme: 'dark',
    wallpaper: 'default.jpg',
    ringtone: 'ringtone',
    volume: 0.5
};

function setTheme(t) {
    settings.theme = t;
    document.body.className = t;
    saveSettings();
}

function setWallpaper(w) {
    settings.wallpaper = w;
    document.body.style.backgroundImage = `url(images/${w})`;
    saveSettings();
}

function saveSettings() {
    fetch(`https://${GetParentResourceName()}/saveSettings`, {
        method:'POST',
        headers:{'Content-Type':'application/json'},
        body: JSON.stringify(settings)
    });
}
