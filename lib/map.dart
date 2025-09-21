import 'dart:async';
import 'package:flutter/material.dart';

// Google Maps
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

// Places SDK
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
as places_sdk;

// Geolocator (لتحديد الموقع الحالي)
import 'package:geolocator/geolocator.dart';

// Polyline package
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as poly;

class MapWithSearchAndRoute extends StatefulWidget {
  const MapWithSearchAndRoute({Key? key}) : super(key: key);

  @override
  State<MapWithSearchAndRoute> createState() => _MapWithSearchAndRouteState();
}

class _MapWithSearchAndRouteState extends State<MapWithSearchAndRoute> {
  final Completer<gmap.GoogleMapController> _mapController = Completer();
  final Set<gmap.Marker> _markers = {};
  final Set<gmap.Polyline> _polylines = {};
  gmap.LatLng? _currentLocation;

  // مفتاح Google API
  final String _apiKey = "AIzaSyCuTilAfnGfkZtIx0T3qfeOmWZ_N2LpoY";

  late places_sdk.FlutterGooglePlacesSdk _placesSdk;
  final poly.PolylinePoints _polylinePoints = poly.PolylinePoints();

  List<places_sdk.AutocompletePrediction> _suggestions = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _placesSdk = places_sdk.FlutterGooglePlacesSdk(_apiKey);
    _determinePositionAndInit();
  }

  Future<void> _determinePositionAndInit() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = gmap.LatLng(pos.latitude, pos.longitude);
      _markers.add(
        gmap.Marker(
          markerId: const gmap.MarkerId('current'),
          position: _currentLocation!,
          infoWindow: const gmap.InfoWindow(title: 'موقعي الحالي'),
        ),
      );
    });
  }

  /// البحث وجلب الاقتراحات
  Future<void> _getAutocomplete(String input) async {
    if (input.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }

    final pred = await _placesSdk.findAutocompletePredictions(
      input,
      countries: const ['eg'], // ممكن تغيرها لأي بلد
    );

    setState(() {
      _suggestions = pred.predictions;
    });
  }

  /// اختيار مكان من الاقتراحات
  Future<void> _selectPlace(places_sdk.AutocompletePrediction prediction) async {
    setState(() => _suggestions = []);

    final details = await _placesSdk.fetchPlace(
      prediction.placeId,
      fields: [places_sdk.PlaceField.Location, places_sdk.PlaceField.Name],
    );

    final loc = details.place?.latLng;
    if (loc == null) return;

    final gmap.LatLng dest = gmap.LatLng(loc.lat, loc.lng);

    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'destination');
      _markers.add(
        gmap.Marker(
          markerId: const gmap.MarkerId('destination'),
          position: dest,
          infoWindow: gmap.InfoWindow(title: details.place?.name ?? prediction.fullText),
        ),
      );
    });

    final controller = await _mapController.future;
    controller.animateCamera(gmap.CameraUpdate.newLatLngZoom(dest, 14));

    if (_currentLocation != null) {
      await _drawRoute(_currentLocation!, dest);
    }
  }

  /// رسم المسار
  Future<void> _drawRoute(gmap.LatLng origin, gmap.LatLng destination) async {
    try {
      final result = await _polylinePoints.getRouteBetweenCoordinates(
        request: poly.PolylineRequest(
          origin: poly.PointLatLng(origin.latitude, origin.longitude),
          destination: poly.PointLatLng(destination.latitude, destination.longitude),
          mode: poly.TravelMode.driving, // بدل null
        ),
      );



      if (result.points.isNotEmpty) {
        final pts = result.points
            .map((p) => gmap.LatLng(p.latitude, p.longitude))
            .toList();

        setState(() {
          _polylines.removeWhere((pl) => pl.polylineId.value == 'route');
          _polylines.add(
            gmap.Polyline(
              polylineId: const gmap.PolylineId('route'),
              points: pts,
              color: Colors.blue,
              width: 5,
            ),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يوجد مسار بين النقطتين')),
        );
      }
    } catch (e) {
      debugPrint('drawRoute error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ أثناء رسم الطريق: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("خريطة مع بحث ومسار")),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          gmap.GoogleMap(
            initialCameraPosition:
            gmap.CameraPosition(target: _currentLocation!, zoom: 14),
            onMapCreated: (controller) {
              if (!_mapController.isCompleted) {
                _mapController.complete(controller);
              }
            },
            markers: _markers,
            polylines: _polylines,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          /// صندوق البحث + الاقتراحات
          Positioned(
            top: 16,
            left: 12,
            right: 12,
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'ابحث عن مكان...',
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    onChanged: (v) => _getAutocomplete(v),
                  ),
                ),
                if (_suggestions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (ctx, i) {
                        final s = _suggestions[i];
                        return ListTile(
                          title: Text(s.fullText),
                          onTap: () => _selectPlace(s),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
