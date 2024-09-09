// JavaScript to handle menu toggle
document.querySelector('.menu-toggle').addEventListener('click', () => {
    const navMenu = document.querySelector('.nav-menu');
    navMenu.classList.toggle('active');
});


// Function to handle download action based on availability
function downloadBook(file, isAvailable) {
    if (isAvailable) {
        window.open(file, '_blank'); // Opens the file in a new tab
    } else {
        showUnavailableModal(); // Show the unavailable card
    }
}

// Show the unavailable modal
function showUnavailableModal() {
    const modal = document.getElementById('unavailableModal');
    modal.style.display = 'flex'; // Display the modal with flex to center content
}

// Close the unavailable modal
function closeUnavailableModal() {
    const modal = document.getElementById('unavailableModal');
    modal.style.display = 'none';
}

// Add active class to the current link
document.addEventListener('DOMContentLoaded', function () {
    // Get all navigation links
    const navLinks = document.querySelectorAll('.nav-links a');
    // Get the current URL path
    const currentPath = window.location.pathname;

    // Loop through each link to find the active one
    navLinks.forEach(link => {
        // Check if the link's href matches the current path
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('active'); // Add active class
        }
    });
});


