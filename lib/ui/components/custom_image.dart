import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomImage extends StatelessWidget {
  bool isNetwork;
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;
  final double radius;

  CustomImage(
      {@required this.url,
      this.width,
      this.height,
      this.fit,
      this.color,
      this.radius}) {
    isNetwork = false;
  }

  CustomImage.network(
      {@required this.url,
      this.width,
      this.height,
      this.fit,
      this.color,
      this.radius}) {
    isNetwork = true;
  }

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.network(
              url,
              width: width,
              height: height,
              fit: fit,
              color: color,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.asset(
              url,
              width: width,
              height: height,
              fit: fit,
              color: color,
            ),
          );
  }
}
