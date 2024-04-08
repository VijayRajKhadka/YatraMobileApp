import 'package:flutter/material.dart';

class ShowMapView extends StatelessWidget {
  final String imageUrl;
  const ShowMapView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(imageUrl,fit: BoxFit.contain)),
    );
  }
}
