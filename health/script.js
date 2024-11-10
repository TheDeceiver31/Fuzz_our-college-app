function goBack() {
    window.history.back();
  }
  
  document.getElementById('appointmentForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const name = document.getElementById('name').value;
    const department = document.getElementById('department').value;
    const date = document.getElementById('date').value;
    
    document.getElementById('confirmation').textContent = `Thank you, ${name}. Your appointment for ${department} on ${date} has been booked.`;
  });
  