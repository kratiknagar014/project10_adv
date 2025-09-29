// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  
  // Backend API Configuration (Development)
  apiUrl: 'http://localhost:8084',
  
  // API Endpoints
  endpoints: {
    auth: '/Auth',
    user: '/User',
    swagger: '/swagger-ui.html',
    apiDocs: '/v2/api-docs'
  },

  // Swagger URL for development
  swaggerUrl: 'http://localhost:8084/swagger-ui.html',
  
  // Feature Flags
  features: {
    enableSwagger: true,
    enableDebugMode: true,
    enableConsoleLogging: true
  },
  
  // App Configuration
  app: {
    name: 'ORS Project - Development',
    version: '1.0.0',
    timeout: 30000, // 30 seconds
    retryAttempts: 3
  },
  
  // Firebase Configuration (Development)
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

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
