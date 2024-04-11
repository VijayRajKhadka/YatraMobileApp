import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:stacked/stacked.dart';
import 'map_screen_view_model.dart';
import '../../../../../services/tiles_services.dart';


class MapView extends StackedView<MapScreenViewMode>{
  final double latitude;
  final double longitude;

  const MapView({required this.latitude, required this.longitude,super.key});

  @override
  Widget builder(BuildContext context, MapScreenViewMode viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 32, // Set the size of the icon here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromRGBO(42, 130, 20, 1),
        title: const Text('Map',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white), ),
        actions: [

          IconButton(
            icon: const Icon(Icons.map,size: 30,color: Colors.white,),
            onPressed: () {
              viewModel.launchGoogleMaps(latitude, longitude);
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          viewModel.zoomIn(latitude, longitude);
        },
        child: MapLayout(
          controller: MapController(
            location: LatLng(Angle.degree(latitude), Angle.degree(longitude)),
            zoom: 17,
          ),
          builder: (context, transformer) {
            final markerLocation =
            transformer.toOffset(LatLng(Angle.degree(latitude), Angle.degree(longitude)));
            return Stack(
              children: [
                TileLayer(
                  builder: (context, x, y, z) {
                    final tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }

                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    return CachedNetworkImage(
                      imageUrl: google(z, x, y),
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  left: markerLocation.dx - 24,
                  top: markerLocation.dy - 48,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  MapScreenViewMode viewModelBuilder(BuildContext context) =>MapScreenViewMode();

}