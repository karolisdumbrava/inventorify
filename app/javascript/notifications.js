document.addEventListener("turbo:load", () => {
  const notifications = document.querySelectorAll('[role="alert"]');

  notifications.forEach((notification) => {
    setTimeout(() => {
      notification.remove();
    }, 5000); // 3000 milliseconds or 3 seconds
  });
});
