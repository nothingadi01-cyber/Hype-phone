function sendDispatch() {
    fetch(`https://${GetParentResourceName()}/sendDispatch`, {
        method: 'POST',
        headers: {'Content-Type':'application/json'},
        body: JSON.stringify({
            job: 'police',
            message: document.getElementById('dispatchMsg').value
        })
    });
}

function panic() {
    fetch(`https://${GetParentResourceName()}/panic`, { method:'POST' });
}

window.addEventListener('message', e => {
    if (e.data.action === 'dispatchAlert') {
        alert(e.data.data.message);
        playSound('message');
    }
});
