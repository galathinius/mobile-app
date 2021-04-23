import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;

  ImageContainer(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Image.network(
            this.imageUrl,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
