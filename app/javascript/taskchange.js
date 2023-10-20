function taskchange () {
   console.log("承認ボタン非同期での処理実装");
 };
//   $(".update-button").on("click", function() {
//     var taskId = $(this).data("task-id");
//     var statusId = $(this).data("status-id");

//     // Ajaxリクエストを送信
//     $.ajax({
//       type: "PATCH", // 更新リクエストのHTTPメソッド
//       url: "/families/1/users/1/tasks/" + taskId, // 更新するタスクのURL
//       data: { task: { status_id: statusId } }, // 更新するデータ
//       success: function(response) {
//         // 更新が成功した場合の処理
//         alert("更新が成功しました");
//       },
//       error: function(xhr, status, error) {
//         // 更新が失敗した場合の処理
//         alert("更新に失敗しました");
//       }
//     });
//   });
// };