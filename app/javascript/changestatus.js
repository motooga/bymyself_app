function changestatus () {
  const statusChangeButtons = document.querySelectorAll('.statuschange');
  // console.log("よみこみ成功！")
  statusChangeButtons.forEach((btn) => {
    btn.addEventListener('click', function(event) {
      event.preventDefault();

      const taskId = btn.getAttribute('data-taskid');
      const newStatus = parseInt(btn.getAttribute('data-newstatus'));
      const familyId = btn.getAttribute('data-family-id');
      const userId = btn.getAttribute('data-user-id')
      // サーバーにAjaxリクエストを送信
      fetch(`/families/${familyId}/users/${userId}/tasks/${taskId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': Rails.csrfToken()
        },
        body: JSON.stringify({ task: { status_id: newStatus } })
      })
      .then(response => response.json())
      .then((json) => console.log(json))
      .then(data => {
        if (data.status === 'success') {
          btn.style.display = 'none';
        } else {
          // 失敗した場合の処理
          alert('エラーが発生しました。');
        }
      })
      .catch(error => {
        console.error('エラー:', error);
      });
    });
  });
};


window.addEventListener('load', changestatus);
