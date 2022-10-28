import consumer from "./consumer"

if(location.pathname.match(/\/items\/\d/)){

  consumer.subscriptions.create("CommentChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `<p>${data.user.nickname}：${data.comment.text}</p>`;
      const comments = document.getElementById("comments");
      comments.insertAdjacentHTML('beforeend', html);
      const commentForm = document.getElementById("comment-form");
      commentForm.reset()
    }
  })
}