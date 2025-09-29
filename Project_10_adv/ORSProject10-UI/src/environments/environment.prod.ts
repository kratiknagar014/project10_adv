// Production Environment Configuration
// Values will be replaced during Docker build process
export const environment = {
  production: true,
  
  // Backend API Configuration (Production)
  apiUrl: 'https://project10.live/api',
  
  // API Endpoints
  endpoints: {
    auth: '/Auth',
    user: '/User',
    swagger: '/swagger-ui.html',
    apiDocs: '/v2/api-docs'
  },

  // Swagger URL for production (disabled in production)
  swaggerUrl: 'https://project10.live/api/swagger-ui.html',
  
  // Feature Flags (Production)
  features: {
    enableSwagger: false, // Disabled in production
    enableDebugMode: false,
    enableConsoleLogging: false
  },
  
  // App Configuration (Production)
  app: {
    name: 'ORS Project',
    version: '1.0.0',
    timeout: 15000, // 15 seconds (faster in prod)
    retryAttempts: 2
  },
  
  // Firebase Configuration (Production)
  firebase: {
    apiKey: "AIzaSyChMHPku8fuoTigQ74J1HbKMJckvCr2qPE",
    authDomain: "orsproject10.firebaseapp.com",
    projectId: "orsproject10",
    storageBucket: "orsproject10.firebasestorage.app",
    messagingSenderId: "926652424779",
    appId: "1:926652424779:web:b10065098ae3c5860123ce",
    vapidKey: "BJbUsHpk-DmmWDEGtYmviKh1slx6i8J2S4mam7wEI95Z4g56ToHRw8EwoRQjoe_SOkfhrLiplgPif7wV3D3Mrxk"
  }
};
