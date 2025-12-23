function buySub(plan){
  fetch(`https://${GetParentResourceName()}/buySub`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ plan })
  })
}
