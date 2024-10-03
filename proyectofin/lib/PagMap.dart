import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagMap extends StatefulWidget {
  const PagMap({Key? key}) : super(key: key);

  @override
  State<PagMap> createState() => _PagMapState();
}

class _PagMapState extends State<PagMap> {
  Position? _currentPosition;

  final MapController _mapaContr = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: 37.223055555556,
      longitude: 38.9225,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _determinarPosicion() async {
    bool serviceEnabled;
    LocationPermission permiso;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Los servicios de ubicación están deshabilitados. Habilite los servicios')));
      return false;
    }
    permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Los permisos de ubicación están denegados')));
        return false;
      }
    }
    if (permiso == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Los permisos de ubicación están denegados permanentemente, no podemos solicitar permisos')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _determinarPosicion();
    final prefs = await SharedPreferences.getInstance();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _loadNoPreferences() {
    _mapaContr.changeLocation(
        GeoPoint(latitude: 19.474180976330988, longitude: -99.04588082060995));
    _mapaContr.addMarker(
        GeoPoint(latitude: 19.474180976330988, longitude: -99.04588082060995));
  }

  @override
  //String coor=_currentPosition.toString();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAPS',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MAPS"),
          backgroundColor: Colors.grey,
          actions: <Widget>[
            Text("Ubicación: " + _currentPosition.toString()),
            IconButton(
                onPressed: _loadNoPreferences,
                icon: const Icon(Icons.location_on_outlined)),
            IconButton(
                onPressed: _getCurrentPosition,
                icon: const Icon(Icons.my_location)),
          ],
        ),
        body: Center(
          child: OSMFlutter(
            controller: _mapaContr,
            trackMyPosition: false,
            initZoom: 15,
            minZoomLevel: 2,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
        ),
      ),
    );
  }
}
