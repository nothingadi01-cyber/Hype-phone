let mediaRecorder, chunks = [], startTime = 0;

async function startRecording() {
  const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
  mediaRecorder = new MediaRecorder(stream);
  chunks = [];
  startTime = Date.now();

  mediaRecorder.ondataavailable = e => chunks.push(e.data);
  mediaRecorder.onstop = async () => {
    const blob = new Blob(chunks, { type: 'audio/webm' });
    const duration = (Date.now() - startTime) / 1000;

    // upload via NUI (base64 for simplicity)
    const reader = new FileReader();
    reader.onloadend = () => {
      fetch(`https://${GetParentResourceName()}/saveVoice`, {
        method: 'POST',
        headers: {'Content-Type':'application/json'},
        body: JSON.stringify({
          sender: currentNumber,
          receiver: activeChat,
          group: activeGroup || null,
          audio: reader.result,
          duration
        })
      });
    };
    reader.readAsDataURL(blob);
  };

  mediaRecorder.start();
}

function stopRecording() {
  if (mediaRecorder) mediaRecorder.stop();
}

function renderVoiceBubble(data){
  const a = document.createElement('audio');
  a.controls = true;
  a.src = data.audio;
  document.getElementById('messages').appendChild(a);
}

window.addEventListener('message', e=>{
  if(e.data.action === 'voiceIncoming'){
    renderVoiceBubble(e.data.data);
  }
});
