import 'dart:async';

import 'package:plusofroad/controller/complaiment_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late Set<Marker>? mymarkers = {
    Marker(markerId: MarkerId("1"), position: LatLng(0, 0)),
  };

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  ComplaintController controller = Get.find();

  late CameraPosition mypos = CameraPosition(target: LatLng(1, 1));

  Widget build(BuildContext context) {
    print("--------------------------------------");
    print(Get.arguments["long"]);
    print(Get.arguments["lat"]);

    return Scaffold(
      body: GoogleMap(
        gestureRecognizers:
            Set()..add(
              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
            ),
        markers: mymarkers!,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (l) {
          mymarkers!.add(
            Marker(
              markerId: MarkerId("1"),
              position: LatLng(l.latitude, l.longitude),
            ),
          );
          controller.lat = l.latitude;
          controller.long = l.longitude;
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          zoom: 9,
          target: LatLng(Get.arguments['lat'], Get.arguments['long']),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(mypos));
  }
}

// import 'dart:collection';
// import 'dart:math';

// import 'package:plusofroad/controller/home/detailscontroller.dart';
// import 'package:plusofroad/core/constants/imageassets.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:maplibre_gl/maplibre_gl.dart';
// import 'package:maplibre_gl/maplibre_gl.dart';
// import 'package:maplibre_gl/maplibre_gl.dart' as maplibre_gl;

// // FIXME: Be sure to set your own API key here. You can register for a free one at https://client.stadiamaps.com/.
// const apiKey = "eO4wq22JDpi7XOT5iyxp";

// enum OfflineDataState { unknown, downloaded, downloading, notDownloaded }

// class MapPage extends StatelessWidget {
//   const MapPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Map();
//   }
// }

// class Map extends StatefulWidget {
//   const Map({super.key});

//   @override
//   State createState() => MapState();
// }

// class MapState extends State<Map> {
//   MaplibreMapController? mapController;
//   DetailsController detailcontroller = Get.find();
//   static const clusterLayer = "clusters";
//   static const unclusteredPointLayer = "unclustered-point";

//   OfflineDataState offlineDataState = OfflineDataState.unknown;
//   double? downloadProgress;

//   @override
//   void dispose() {
//     mapController?.onFeatureTapped.remove(_onFeatureTapped);
//     super.dispose();
//   }

//   void _onMapCreated(MaplibreMapController controller) async {
//     Position myposition = await Geolocator.getCurrentPosition();
//     detailcontroller.lat = myposition!.latitude.toString();
//     detailcontroller.long = myposition!.longitude.toString();
//     print("on map created ");
//     print("-------------------> $myposition");
//     mapController = controller;
//     mapController!.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: LatLng(
//           myposition.latitude,
//           myposition.longitude,
//         ),
//         zoom: 12)));
//     mapController?.addSymbol(
//       SymbolOptions(
//         iconAnchor: "as",
//         iconSize: 0.1,
//         geometry: LatLng(
//           myposition.latitude,
//           myposition.longitude,
//         ),
//         iconImage: ImageAssets.placeholder,
//       ),
//     );
//     // Event listener that fires for the cluster layer (not due to an explicit
//     // filter; only a consequence of the current mix of layers used).
//     controller.onFeatureTapped.add(_onFeatureTapped);

//     // Determine if we have data stored offline. Note that this is a fairly
//     // crude check, and if you are dealing with multiple styles or regions,
//     // you will want to do something a bit more advanced.
//     final result = await getListOfRegions();
//     setState(() {
//       if (result.isEmpty) {
//         offlineDataState = OfflineDataState.notDownloaded;
//       } else {
//         offlineDataState = OfflineDataState.downloaded;
//       }
//     });
//   }

//   void _onStyleLoadedCallback() async {
//     const sourceId = "locations";
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: const Text("Style loaded"),
//       backgroundColor: Theme.of(context).primaryColor,
//       duration: const Duration(seconds: 1),
//     ));

//     // Alternate form when using hard-coded local data; load this however you like
//     // await addClusteredPointSource(sourceId, {
//     //   "type": "FeatureCollection",
//     //   "features": [
//     //     {
//     //       "type": "Feature",
//     //       "geometry": {
//     //         "type": "Point",
//     //         "coordinates": [-77.03238901390978, 38.913188059745586]
//     //       },
//     //       "properties": {"title": "Washington, DC"}
//     //     },
//     //     {
//     //       "type": "Feature",
//     //       "geometry": {
//     //         "type": "Point",
//     //         "coordinates": [-122.414, 37.776]
//     //       },
//     //       "properties": {"title": "San Francisco"}
//     //     }
//     //   ]
//     // });
//     await addClusteredPointSource(sourceId,
//         "https://maplibre.org/maplibre-gl-js-docs/assets/earthquakes.geojson");
//     await addClusteredPointLayers(sourceId);
//   }

//   // Logic for interacting with clusters on iOS.
//   // See bug report: https://github.com/m0nac0/flutter-maplibre-gl/issues/160
//   void _onFeatureTapped(
//       dynamic featureId, Point<double> point, LatLng coords) async {
//     var features =
//         await mapController?.queryRenderedFeatures(point, [clusterLayer], null);
//     if (features?.isNotEmpty ?? false) {
//       // Naive zoom += 2. There is a `getClusterExpansionZoom` method
//       // on sources, but the Flutter wrapper does not actually expose
//       // sources at the moment so we're just falling back to a simple
//       // approach.
//       mapController!.animateCamera(CameraUpdate.newLatLngZoom(
//           coords, mapController!.cameraPosition!.zoom + 2));
//     }
//   }

//   // This method handles interaction with the actual earthquake points on iOS.
//   // See bug report: https://github.com/m0nac0/flutter-maplibre-gl/issues/160

//   void _onMapClick(Point<double> point, LatLng coordinates) async {
//     print("click map $coordinates");
//     mapController?.addSymbol(
//       SymbolOptions(
//         iconAnchor: "as",
//         iconSize: 0.1,
//         geometry: LatLng(
//           coordinates.latitude,
//           coordinates.longitude,
//         ),
//         iconImage: ImageAssets.placeholder,
//       ),
//     );
//     detailcontroller.lat = coordinates!.latitude.toString();
//     detailcontroller.long = coordinates!.longitude.toString();
//     print(mapController!.symbols.first.id);
//     if (mapController!.symbols.length > 1) {
//       mapController?.removeSymbol(Symbol(
//           mapController!.symbols.first.id,
//           SymbolOptions(
//             iconAnchor: "as",
//             iconSize: 0.1,
//             geometry: LatLng(
//               coordinates.latitude,
//               coordinates.longitude,
//             ),
//             iconImage: ImageAssets.placeholder,
//           )));
//     }
//     var messenger = ScaffoldMessenger.of(context);
//     var color = Theme.of(context).primaryColor;
//     // mapController!.addImage("name", "bytes");

//     var features = await mapController?.queryRenderedFeatures(
//         point, [unclusteredPointLayer], null);
//     // if (features?.isNotEmpty ?? false) {
//     // var feature = HashMap.from(features!.first);
//     messenger.showSnackBar(SnackBar(
//       content: Text("Magnitude  earthquake"),
//       backgroundColor: color,
//       duration: const Duration(seconds: 3),
//     ));
//     // }
//   }

//   // Adds a data source to the map via a GeoJSON layer. The data is assumed
//   // to be a PointCollection
//   Future<void>? addClusteredPointSource(String sourceId, Object? data) {
//     return mapController?.addSource(
//         sourceId, GeojsonSourceProperties(data: data, cluster: true));
//   }

//   Future<void> addClusteredPointLayers(String sourceId) async {
//     await mapController?.addCircleLayer(
//         sourceId,
//         clusterLayer,
//         const CircleLayerProperties(circleColor: [
//           "step",
//           ["get", "point_count"],
//           "#51bbd6",
//           100,
//           "#f1f075",
//           750,
//           "#f28cb1"
//         ], circleRadius: [
//           "step",
//           ["get", "point_count"],
//           20,
//           100,
//           30,
//           750,
//           40
//         ]),
//         filter: ["has", "point_count"]);

//     await mapController?.addSymbolLayer(
//         sourceId,
//         "cluster-count",
//         const SymbolLayerProperties(
//             // NOTE: I would expect to be able to do something like "{point_count_abbreviated}", but this breaks on Android
//             textField: [Expressions.get, "point_count_abbreviated"],
//             textFont: ["Open Sans Regular"]),
//         filter: ["has", "point_count"]);

//     await mapController?.addCircleLayer(
//         sourceId,
//         unclusteredPointLayer,
//         const CircleLayerProperties(
//             circleColor: "#11b4da",
//             circleRadius: 8,
//             circleStrokeWidth: 1,
//             circleStrokeColor: "#fff"),
//         filter: [
//           "!",
//           ["has", "point_count"]
//         ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaplibreMap(
//       styleString:
//           "https://api.maptiler.com/maps/streets-v2/style.json?key=eO4wq22JDpi7XOT5iyxp",

//       // myLocationEnabled: true,
//       initialCameraPosition: const CameraPosition(
//           target: LatLng(6.871696628915218, 5.816140527741339), zoom: 4),
//       onMapCreated: _onMapCreated,
//       onStyleLoadedCallback: _onStyleLoadedCallback,
//       onMapClick: _onMapClick,
//       trackCameraPosition: true,
//     );
//   }

//   String _mapStyleUrl() {
//     const styleUrl =
//         "https://tiles.stadiamaps.com/styles/alidade_smooth_dark.json";
//     return "$styleUrl?api_key=$apiKey";
//   }
// }
