function takePhoto() {
    fetch(`https://${GetParentResourceName()}/takePhoto`, { method: 'POST' });
}

function loadGallery() {
    fetch(`https://${GetParentResourceName()}/loadGallery`, { method: 'POST' })
    .then(res => res.json())
    .then(images => {
        const g = document.getElementById('gallery');
        g.innerHTML = '';
        images.forEach(img => {
            const i = document.createElement('img');
            i.src = img.image;
            i.className = 'gallery-img';
            g.appendChild(i);
        });
    });
}

window.addEventListener('message', e => {
    if (e.data.action === 'photoSaved') {
        loadGallery();
    }
});
