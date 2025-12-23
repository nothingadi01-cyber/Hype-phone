function createGroup(){
  fetch(`https://${GetParentResourceName()}/createGroup`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({name:document.getElementById('groupName').value})
  })
}
