function postStory(img, caption){
  fetch(`https://${GetParentResourceName()}/addStory`,{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({ image: img, caption })
  })
}
