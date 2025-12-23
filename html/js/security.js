function unlock(){
  fetch(`https://${GetParentResourceName()}/unlockPhone`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ pin: document.getElementById('pinInput').value })
  }).then(r=>r.json()).then(ok=>{
    if(ok){ document.getElementById('lockScreen').style.display='none'; }
  })
}

window.addEventListener('message', e=>{
  if(e.data.action==='autoLock'){
    document.getElementById('lockScreen').style.display='block';
  }
})
