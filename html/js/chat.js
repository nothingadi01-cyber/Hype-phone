function sendMsg() {
    const input = document.getElementById('msgInput');
    if (!input.value) return;

    fetch(`https://${GetParentResourceName()}/sendMessage`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            from: "555001",
            to: "555002",
            message: input.value
        })
    });

    addBubble(input.value, true);
    input.value = "";
}

function addBubble(text, mine) {
    const div = document.createElement('div');
    div.className = mine ? 'bubble mine' : 'bubble';
    div.innerText = text;
    document.getElementById('messages').appendChild(div);
}

window.addEventListener('message', function(e) {
    if (e.data.action === 'newMessage') {
        addBubble(e.data.data.message, false);
        playSound();
    }
});

function playSound() {
    const audio = new Audio('./sounds/message.ogg');
    audio.play();
}
