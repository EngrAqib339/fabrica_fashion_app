import '../Model/location_model.dart';
import '../models/location_model.dart';

class LocationController {
  late LocationModel _selectedLocation;

  LocationController() {
    // Initialize with a default location (San Francisco)
    _selectedLocation = LocationModel(latitude: 37.7749, longitude: -122.4194);
  }

  // Get the current selected location
  LocationModel get selectedLocation => _selectedLocation;

  // Update the selected location
  void updateSelectedLocation(double latitude, double longitude) {
    _selectedLocation = LocationModel(latitude: latitude, longitude: longitude);
  }

  // Save the location (e.g., send it to a server or database)
  void saveLocation() {
    // Logic to save location goes here
    print("Location Saved: $_selectedLocation");
  }
}
