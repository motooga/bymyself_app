function changestatus () {
  console.log("success")
  document.addEventListener('ajax:success', function(event) {
    const element = event.target;
    const taskId = element.getAttribute('data-task-id');
  
   const taskStatusChangeDiv = document.getElementById('task-status-change-' + taskId);
    if (taskStatusChangeDiv) {
      taskStatusChangeDiv.style.display = 'none';
    }
  })};
  window.addEventListener('load', changestatus);