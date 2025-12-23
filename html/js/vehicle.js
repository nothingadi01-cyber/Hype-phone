function vehLock(state){
  fetch(`https://${GetParentResourceName()}/vehLock`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ state })
  })
}

function vehEngine(state){
  fetch(`https://${GetParentResourceName()}/vehEngine`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ state })
  })
}

function vehLocate(){
  fetch(`https://${GetParentResourceName()}/vehLocate`,{method:'POST'})
}
