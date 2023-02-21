import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;

  const CachedImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        placeholder: (_, __) =>
            ShimmerBox(height: height, width: width, radius: 16),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
      ),
    );
  }
}
