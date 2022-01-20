import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/theme_app.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {Key? key, this.imageProvider, this.imageRadius = 30, required this.name})
      : super(key: key);

  final String name;
  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: imageRadius,
        child: imageProvider != null
            ? CircleAvatar(
                radius: imageRadius - 5,
                backgroundImage: imageProvider,
              )
            : Text(
                name[0].toUpperCase(),
                style: DemoTheme.lightTextTheme.headline3,
              ));
  }
}
