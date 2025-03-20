document.addEventListener("DOMContentLoaded", function () {
    // Initialize the map
    var map = L.map('map').setView([12.9716, 77.5946], 7); // Default View

    // Add OpenStreetMap tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors'
    }).addTo(map);

    // Source and Destination (Dynamic Values)
    var source = [12.9716, 77.5946]; // Example: Bangalore
    var destination = [13.0827, 80.2707]; // Example: Chennai

    // Add Markers
    L.marker(source).addTo(map).bindPopup("Source: Bangalore").openPopup();
    L.marker(destination).addTo(map).bindPopup("Destination: Chennai");

    // Add Routing
    L.Routing.control({
        waypoints: [
            L.latLng(source),
            L.latLng(destination)
        ],
        routeWhileDragging: true
    }).addTo(map);
});
