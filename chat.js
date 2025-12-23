window.addEventListener('message', function(e) {
    if (e.data.action === 'newMessage') {
        addBubble(e.data.data.message, false);
        playSound('message');
    }
});
