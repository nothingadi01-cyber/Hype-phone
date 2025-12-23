function buyItem(id){
  fetch(`https://${GetParentResourceName()}/buyItem`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ id })
  })
}
