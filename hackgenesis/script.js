// Alumni and Mentor Profiles Data
const profiles = [
    { 
        name: "Neel Panchal", 
        role: "CEO and Founder of Pratham Youth Community", 
        bio: "Neel Panchal is the CEO and Founder of Pratham Youth Community, which has a strong presence in various colleges, including more than 10 institutions and over 250 coordinators. Pratham focuses on connecting students with local businesses, offering customized products like affordable, high-quality notebooks directly to consumers. Neel has combined his entrepreneurial spirit with his academic background from *IITRAM* (Institute of Infrastructure, Technology, Research, and Management), where he has been actively involved in projects that benefit both students and local communities. His initiative is not just a business but a platform for career growth, offering internships and promoting student involvement across various sectors.",
        image: "neel.jpg", // Path to alumni photo
        audio: "earthaud.mp3", // Path to audio file
        type: "alumni" 
    },
    { 
        name: "Tarang Kumar", 
        role: "Leadership roles in venture capital...",
        bio: "Tarang Kumar is an alumnus of IITRAM, known for his significant contributions in the field of infrastructure and engineering. He completed his B.Tech at IITRAM and has worked with leading companies like Shapoorji Pallonji & Co. Pvt. Ltd. His career showcases expertise in large-scale projects and engineering solutions, with a particular focus on construction and development. Currently, he is involved in expanding his professional horizons, continuing to shape his career in the dynamic construction industry.",
        image: "tarang.jpg", // Path to alumni photo
        audio: "event1.mp3", // Path to audio file
        type: "alumni" 
    },
    // Add more profiles as needed
];

// Event Images Data for Photos of Past Events Section
const eventPhotos = [
    { src: "KNOW.jpg", alt: "Know your Alumni" },
    { src: "CONVO.jpg", alt: "Convocation" },
    { src: "VOLLYBALL.jpg", alt: "INTRA IITRAM VOLLEYBALL 2024" }
];

// Load Profiles and Event Photos into their sections
function loadProfiles() {
    const alumniSection = document.getElementById('alumni-section');
    const mentorshipSection = document.getElementById('mentorship-section');

    profiles.forEach(profile => {
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `
            <div class="card-image">
                <img src="${profile.image}" alt="${profile.name}'s photo">
            </div>
            <div class="card-content">
                <h3>${profile.name}</h3>
                <p>${profile.role}</p>
                <button class="connect-btn" onclick="showProfileModalAndPlaySound('${profile.name}', '${profile.role}', '${profile.bio}', '${profile.audio}')">
                    Learn More
                </button>
            </div>
        `;
        profile.type === 'alumni' ? alumniSection.appendChild(card) : mentorshipSection.appendChild(card);
    });
}

function loadEventPhotos() {
    const photosGallery = document.getElementById('photos-gallery');

    eventPhotos.forEach(photo => {
        const photoCard = document.createElement('div');
        photoCard.className = 'photo-card';
        photoCard.innerHTML = `<img src="${photo.src}" alt="${photo.alt}" onclick="showPhotoModal('${photo.src}', '${photo.alt}')">`;
        photosGallery.appendChild(photoCard);
    });
}

// Display Profile Modal with Details and Play Audio
let currentAudio = null;

function showProfileModalAndPlaySound(name, role, bio, audioSrc) {
    // Display modal
    document.getElementById('modal-name').textContent = name;
    document.getElementById('modal-role').textContent = role;
    document.getElementById('modal-bio').textContent = bio;
    document.getElementById('profile-modal').style.display = 'flex';

    // Play audio
    if (currentAudio) {
        currentAudio.pause(); // Stop any previously playing audio
        currentAudio.currentTime = 0; // Reset to the beginning
    }
    currentAudio = new Audio(audioSrc);
    currentAudio.play();
}

function closeModal() {
    document.getElementById('profile-modal').style.display = 'none';
    if (currentAudio) {
        currentAudio.pause(); // Pause audio when modal is closed
    }
}

// Display Photo Modal
function showPhotoModal(src, alt) {
    const photoModal = document.getElementById('photo-modal');
    const photoModalImage = document.getElementById('photo-modal-image');
    photoModalImage.src = src;
    photoModalImage.alt = alt;
    photoModal.style.display = 'flex';
}

function closePhotoModal() {
    document.getElementById('photo-modal').style.display = 'none';
}

// Initialize Profiles and Event Photos on Page Load
document.addEventListener('DOMContentLoaded', () => {
    loadProfiles();
    loadEventPhotos();
});
