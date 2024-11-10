// Variable to keep track of the currently playing audio
let currentAudio = null;

// Function to show the modal and play sound
function showDetailsAndPlaySound(modalId, audioSrc) {
    // Display the modal
    var modal = document.getElementById(modalId);
    modal.style.display = "block";

    // Stop any currently playing audio
    if (currentAudio) {
        currentAudio.pause();
        currentAudio.currentTime = 0;
    }

    // Play the new audio
    currentAudio = new Audio(audioSrc);
    currentAudio.play();
}

// Function to close the modal when the close button is clicked
function closeDetails(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";

    // Pause audio when modal is closed
    if (currentAudio) {
        currentAudio.pause();
    }
}

// Close the modal if the user clicks outside the modal content
window.onclick = function(event) {
    var modals = document.getElementsByClassName("modal");
    for (var i = 0; i < modals.length; i++) {
        if (event.target == modals[i]) {
            modals[i].style.display = "none";

            // Pause audio if modal is closed by clicking outside
            if (currentAudio) {
                currentAudio.pause();
            }
        }
    }
}
