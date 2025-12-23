window.addEventListener('message', e=>{
  if(e.data.action === 'updateHealth'){
    document.getElementById('hp').innerText = 'HP: ' + e.data.health;
    document.getElementById('armor').innerText = 'Armor: ' + e.data.armor;
  }
});
