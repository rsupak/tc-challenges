/* Get the videoents */
const player = document.querySelector(".player");
const video = player.querySelector(".viewer");
const progress = player.querySelector(".progress");
const progressBar = player.querySelector(".progress__filled");
const toggle = player.querySelector(".toggle");
const skipButtons = player.querySelectorAll("[data-skip]");
const ranges = player.querySelectorAll(".player__slider");
const fullscreen = player.querySelector(".fullscreen");
const mutebtn = player.querySelector(".mutebtn");

/* Build out functions */
function togglePlay() {
  video.paused ? video.play() : video.pause();
}

// Updates the button display dependent upon state of vid.paused
function updateButton() {
  video.paused ? (toggle.innerHTML = "►") : (toggle.innerHTML = "❚❚");
}

// Updates video progress either forward 25 secs or back 10 secs
function skip() {
  video.currentTime += parseFloat(this.dataset.skip);
}

// Updates volume and speed parameters
function handleRangeUpdate() {
  video[this.name] = this.value;
}

// Shows progress in relation to duration
function handleProgress() {
  const percent = (video.currentTime / video.duration) * 100;
  progressBar.style.flexBasis = `${percent}%`;
}

// Moves video location in reference to progress bar
function scrub(e) {
  const scrubTime = (e.offsetX / progress.offsetWidth) * video.duration;
  video.currentTime = scrubTime;
}

// Toggles full screen ([Esc] to exit)
function toggleFullScreen() {
  if (video.requestFullScreen) {
    video.requestFullScreen();
  } else if (video.mozRequestFullScreen) {
    video.mozRequestFullScreen();
  } else if (video.webkitRequestFullScreen) {
    video.webkitRequestFullScreen();
  }
}

// Toggles Volume mute controll
function toggleMute() {
  if (video.muted) {
    video.muted = false;
    mutebtn.innerHTML = "&#128266";
  } else {
    video.muted = true;
    mutebtn.innerHTML = "&#128263";
  }
}

/* Hook up the event listeners */

// progress bar listeners
let mousedown = false;
progress.addEventListener("click", scrub);
progress.addEventListener("mousedown", () => (mousedown = true));
progress.addEventListener("mousemove", e => mousedown && scrub(e));
progress.addEventListener("mouseup", () => (mousedown = false));

// range listeners
ranges.forEach(range => range.addEventListener("change", handleRangeUpdate));
ranges.forEach(range => range.addEventListener("mousemove", handleRangeUpdate));

// skip listeners
skipButtons.forEach(button => button.addEventListener("click", skip));

// button update listeners
toggle.addEventListener("click", togglePlay);
fullscreen.addEventListener("click", toggleFullScreen);
mutebtn.addEventListener("click", toggleMute);

// video play/pause listeners
video.addEventListener("click", togglePlay);
video.addEventListener("play", updateButton);
video.addEventListener("pause", updateButton);
video.addEventListener("timeupdate", handleProgress);
