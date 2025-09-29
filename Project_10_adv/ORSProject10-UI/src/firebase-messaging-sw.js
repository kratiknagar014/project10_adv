// Firebase Messaging Service Worker
// This file handles background notifications when the app is not in focus

importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');

// Initialize Firebase in the service worker
firebase.initializeApp({
  apiKey: "AIzaSyChMHPku8fuoTigQ74J1HbKMJckvCr2qPE",
  authDomain: "orsproject10.firebaseapp.com",
  projectId: "orsproject10",
  storageBucket: "orsproject10.firebasestorage.app",
  messagingSenderId: "926652424779",
  appId: "1:926652424779:web:b10065098ae3c5860123ce"
});

// Retrieve Firebase Messaging object
const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage((payload) => {
  console.log('Received background message:', payload);

  const notificationTitle = payload.notification?.title || 'ORS Notification';
  const notificationOptions = {
    body: payload.notification?.body || 'You have a new notification',
    icon: '/assets/icons/notification-icon.png',
    badge: '/assets/icons/badge-icon.png',
    tag: 'ors-notification',
    requireInteraction: true,
    actions: [
      {
        action: 'view',
        title: 'View',
        icon: '/assets/icons/view-icon.png'
      },
      {
        action: 'dismiss',
        title: 'Dismiss',
        icon: '/assets/icons/dismiss-icon.png'
      }
    ],
    data: {
      url: payload.data?.clickAction || '/notifications',
      ...payload.data
    }
  };

  // Show the notification
  self.registration.showNotification(notificationTitle, notificationOptions);
});

// Handle notification click events
self.addEventListener('notificationclick', (event) => {
  console.log('Notification clicked:', event);

  event.notification.close();

  if (event.action === 'view') {
    // Open the app and navigate to notifications
    event.waitUntil(
      clients.openWindow(event.notification.data.url || '/notifications')
    );
  } else if (event.action === 'dismiss') {
    // Just close the notification
    console.log('Notification dismissed');
  } else {
    // Default click action - open the app
    event.waitUntil(
      clients.openWindow(event.notification.data.url || '/notifications')
    );
  }
});

// Handle notification close events
self.addEventListener('notificationclose', (event) => {
  console.log('Notification closed:', event);
});
