function taskchange () {
  const statusChangeButtons = document.querySelectorAll('.statuschange');

  statusChangeButtons.forEach(button => {
    button.addEventListener('click', function(event) {
      event.preventDefault();

      const taskId = button.getAttribute('data-task-id');
      const newStatus = parseInt(button.getAttribute('data-new-status'));

      // サーバーにAjaxリクエストを送信
      fetch(`/families/${family_id}/users/${user_id}/tasks/${taskId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': Rails.csrfToken()
        },
        body: JSON.stringify({ task: { status_id: newStatus } })
      })
      .then(response => response.json())
      .then(data => {
        // サーバーからの応答を処理
        if (data.status === 'success') {
          // 成功した場合の処理
          location.reload(); // ページをリロードするか、UIを更新
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


window.addEventListener('load', taskchange);
