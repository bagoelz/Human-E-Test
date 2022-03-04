
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color placeholder;
  final String url;

  const ImageContainer(
      {Key? key,
      required this.width,
      required this.height,
      this.placeholder = const Color(0xFFEEEEEE),
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
          color: placeholder,
          image:DecorationImage(image: NetworkImage(url),fit: BoxFit.cover)),
    );
  }
}