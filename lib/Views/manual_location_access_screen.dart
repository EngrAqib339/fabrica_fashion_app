import 'package:flutter/material.dart';
//import '''package:google_maps_flutter/google_maps_flutter.dart''';
import '../Model/location_model.dart';
import '../controllers/location_controller.dart';
import '../models/location_model.dart';

class ManualLocationAccessScreen extends StatefulWidget {
  @override
  _ManualLocationAccessScreenState createState() =>
      _ManualLocationAccessScreenState();
}

class _ManualLocationAccessScreenState
    extends State<ManualLocationAccessScreen> {
  final LocationController _locationController = LocationController();
 // GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manual Location Access"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Google Map View
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                _locationController.selectedLocation.latitude,
                _locationController.selectedLocation.longitude,
              ),
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: {
              Marker(
                markerId: MarkerId('selectedLocation'),
                position: LatLng(
                  _locationController.selectedLocation.latitude,
                  _locationController.selectedLocation.longitude,
                ),
                draggable: true,
                onDragEnd: (LatLng newPosition) => setState(() {
                    _locationController.updateSelectedLocation(
                        newPosition.latitude, newPosition.longitude);
                  }),
              ),
            },
            onTap: (LatLng position) {
              setState(() {
                _locationController.updateSelectedLocation(
                    position.latitude, position.longitude);
              });
            },
          ),

          // Search Bar
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search location...",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // Optional: Integrate Google Places API here
                        print("Search submitted: $value");
                      },
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),

          // Save Location Button
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: ElevatedButton(
              onPressed: () {
                _locationController.saveLocation();
                final LocationModel savedLocation =
                    _locationController.selectedLocation;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Location saved: Lat: ${savedLocation.latitude}, Lng: ${savedLocation.longitude}"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Save Location",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
