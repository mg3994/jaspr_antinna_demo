const cacheName = 'offline-v1';
const cacheFiles = [
    '/',
    'favicon.ico',
    //Pages
    '/jaspr_antinna_demo/',
    '/about/',
    // SW //
    '/script.js',
    // '/styles.css',
];

self.addEventListener('install', e => {
    console.log('Service Worker: Installed');
    e.waitUntil(
        caches.open(cacheName)
        .then(cache => {
            console.log('Service Worker: Caching Files');
            cache.addAll(cacheFiles);
        })
        .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', e => {
    console.log('Service Worker: Activated');
    e.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cache => {
                    if (cache !== cacheName) {
                        console.log('Service Worker: Clearing Old Cache');
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
});

self.addEventListener('fetch', e => {
    console.log('Service Worker: Fetching');
    e.respondWith(
        fetch(e.request)
        .then(response => {
            const clone = response.clone();
            caches.open(cacheName)
                .then(cache => {
                    cache.put(e.request, clone);
                });
            return response;
        })
        .catch(() => caches.match(e.request).then(response => response))
    );
});