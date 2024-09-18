// Service Worker Registration
if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('./service_worker.js')
        .then(reg => {
            console.log('Service Worker registered');
        })
        .catch(error => {
            console.error('Service Worker registration failed:', error);
        });
}