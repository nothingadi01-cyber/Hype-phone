function dial() {
    fetch(`https://${GetParentResourceName()}/startCall`, {
        method: 'POST',
        headers: {'Content-Type':'application/json'},
        body: JSON.stringify({
            from: "555001",
            to: document.getElementById('callNumber').value
        })
    });
}

function acceptCall() {
    fetch(`https://${GetParentResourceName()}/acceptCall`, {
        method: 'POST',
        body: JSON.stringify({ from: "555002", to: "555001" })
    });
}

function rejectCall() {
    fetch(`https://${GetParentResourceName()}/rejectCall`, {
        method: 'POST',
        body: JSON.stringify({ from: "555002", to: "555001" })
    });
}

window.addEventListener('message', e => {
    if (e.data.action === 'incomingCall') {
        document.getElementById('incomingCall').style.display = 'block';
        document.getElementById('callerId').innerText =
            'Incoming call from ' + e.data.data.from;
    }
});
