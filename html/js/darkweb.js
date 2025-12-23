function loadCrypto() {
    fetch(`https://${GetParentResourceName()}/getCrypto`, { method:'POST' })
    .then(res => res.json())
    .then(b => {
        document.getElementById('cryptoBalance').innerText = b + ' BTC';
    });
}

function buyItem(item) {
    fetch(`https://${GetParentResourceName()}/darkBuy`, {
        method:'POST',
        headers:{'Content-Type':'application/json'},
        body: JSON.stringify({ item })
    });
}
