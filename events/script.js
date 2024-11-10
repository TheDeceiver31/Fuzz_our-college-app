// Add event listeners to buttons
const detailsButtons = document.querySelectorAll('.details-btn');
const eventDetailsSections = document.querySelectorAll('.event-details');

// Select the audio elements for each event
const sounds = [
    document.getElementById('sound-event-1'),
    document.getElementById('sound-event-2'),
    document.getElementById('sound-event-3')
];

// Add click event to each button to show the corresponding details section and play sound
detailsButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        // Show the corresponding details
        eventDetailsSections.forEach((section, i) => {
            if (i === index) {
                section.classList.add('active'); // Show only the clicked event's details
            } else {
                section.classList.remove('active'); // Hide other details
            }
        });
        
        // Stop and reset the previous sound before playing the new one
        sounds.forEach(sound => sound.pause());
        sounds.forEach(sound => sound.currentTime = 0);

        // Play the corresponding sound for the clicked event
        sounds[index].play();
    });
});

// Function to close event details
function closeEventDetails() {
    const eventDetailsSections = document.querySelectorAll('.event-details');
    eventDetailsSections.forEach((section) => {
        section.classList.remove('active'); // Hide all details sections
    });
}
