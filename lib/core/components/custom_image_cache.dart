import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final String placeHolderUrl;
  final double width;
  final double height;
  final bool isImageCircle;
  final double borderRadius;
  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.isImageCircle = false,
    this.placeHolderUrl = '',
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isImageCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isImageCircle
              ? null
              : BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: isImageCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isImageCircle
              ? null
              : BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),

      // Should put any image here like app logo or not found image instead of this icon in error case
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
