// Function to toggle the dropdown visibility
function toggleDropdown() {
    var dropdown = document.getElementById('dropdown');
    dropdown.classList.toggle('show');
  }
  
  // Function to filter faculty by department
  function filterFaculty(department) {
    const allFaculty = document.querySelectorAll('.faculty-member');
    
    allFaculty.forEach(faculty => {
      if (department === 'All' || faculty.getAttribute('data-department') === department) {
        faculty.style.display = 'block'; // Show faculty
      } else {
        faculty.style.display = 'none'; // Hide faculty
      }
    });
  
    // Close the dropdown after selecting a department
    document.getElementById('dropdown').classList.remove('show');
  }
  
  // Show details of a faculty member
  function showDetails(facultyId) {
    document.getElementById(facultyId).style.display = "block";
  }
  
  // Close the details of a faculty member
  function closeDetails(facultyId) {
    document.getElementById(facultyId).style.display = "none";
  }