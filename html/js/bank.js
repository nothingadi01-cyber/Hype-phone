function loadBalance() {
    fetch(`https://${GetParentResourceName()}/getBalance`, {
        method: 'POST',
        body: JSON.stringify({ phone: "555001" })
    })
    .then(res => res.json())
    .then(balance => {
        document.getElementById('balance').innerText =
            "Balance: ₹" + balance;
    });
}

function sendMoney() {
    fetch(`https://${GetParentResourceName()}/transferMoney`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            from: "555001",
            to: document.getElementById('toNumber').value,
            amount: document.getElementById('amount').value
        })
    });
}
