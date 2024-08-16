import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapContainer extends StatelessWidget {
  final double? x;
  final double? y;

  const GoogleMapContainer({
    super.key,
    @required this.x,
    @required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: 300, // Adjust the height as needed
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(33.514024, 36.292173),
            zoom: 14.0,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('selected-position'),
              position: LatLng(33.514024, 36.292173),
            ),
          },
        ),
      ),
    );
  }
}
