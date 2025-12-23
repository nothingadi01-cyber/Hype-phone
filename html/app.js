window.addEventListener('message', function(event) {
  if (event.data.action === "openPhone") {
    document.getElementById("phone").style.display = "block";
  }
});

function closePhone() {
  fetch(`https://${GetParentResourceName()}/close`, {
    method: "POST"
  });
}
