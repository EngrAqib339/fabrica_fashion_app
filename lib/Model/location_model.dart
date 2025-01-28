class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({required this.latitude, required this.longitude});

  // Convert to string (for debugging/logging purposes)
  @override
  String toString() {
    return 'Lat: $latitude, Lng: $longitude';
  }
}
