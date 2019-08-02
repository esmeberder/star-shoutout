let constraintObj = {
    audio: true,
    video: true
};



navigator.mediaDevices.getUserMedia(constraintObj)
.then(function(mediaStreamObj) {
    let video = document.getElementById('recorder');
    if ("srcObject" in video) {
        video.srcObject = mediaStreamObj;
    } else {

        video.src = window.URL.createObjectURL(mediaStreamObj);
    }

    video.onloadedmetadata = function(ev) {
        video.play();
    };

    let start = document.getElementById('btnStart');
    let stop = document.getElementById('btnStop');
    let vidSave = document.getElementById('vid2');
    let mediaRecorder = new MediaRecorder(mediaStreamObj);
    let chunks = [];

    start.addEventListener('click', (ev)=>{
        mediaRecorder.start();
        console.log(mediaRecorder.state);
    })
    stop.addEventListener('click', (ev)=>{
        mediaRecorder.stop();
        console.log(mediaRecorder.state);
    });
    mediaRecorder.ondataavailable = function(ev) {
        chunks.push(ev.data);
    }
    mediaRecorder.onstop = (ev)=>{
        let blob = new Blob(chunks, { 'type' : 'video/mp4;' });
        chunks = [];
        let videoURL = window.URL.createObjectURL(blob);
        vidSave.src = videoURL;
    }
})
.catch(function(err) {
    console.log(err.name, err.message);
});


var testingVideo = "TESTTESTTEST";
console.log(testingVideo)

