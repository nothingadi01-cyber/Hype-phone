function propLock(state){
  fetch(`https://${GetParentResourceName()}/propLock`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ state })
  })
}

function shareKey(){
  fetch(`https://${GetParentResourceName()}/propShare`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({
      target: document.getElementById('shareId').value
    })
  })
}
