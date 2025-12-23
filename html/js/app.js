window.addEventListener('message', function (e) {
    if (e.data.action === 'open') {
        document.getElementById('phone').style.display = 'block';
    }
});

function closePhone() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST'
    });
}
