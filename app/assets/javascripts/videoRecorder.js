
// let constraintObj = {
//   audio: true,
//   video: true
// }

// navigator.mediaDevices.getUserMedia(constraintObj)
// .then(function(mediaStreamObj) {
//   // connect media stream to the first video element
//   let video = document.querySelector('video');
//   if ("srcObject" in video) {
//     video.srcObject = media
//   }
// })

let constraintObj = {
    audio: true,
    video: true
};



navigator.mediaDevices.getUserMedia(constraintObj)
.then(function(mediaStreamObj) {
    //connect the media stream to the first video element
    let video = document.querySelector('video');
    if ("srcObject" in video) {
        video.srcObject = mediaStreamObj;
    } else {
        //old version
        video.src = window.URL.createObjectURL(mediaStreamObj);
    }

    video.onloadedmetadata = function(ev) {
        //show in the video element what is being captured by the webcam
        video.play();
    };

    //add listeners for saving video/audio
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

// <video id="vid2" controls="" src="blob:http://localhost:3000/756399d5-6781-46b5-ab5f-2938c8fb9636"></video>
