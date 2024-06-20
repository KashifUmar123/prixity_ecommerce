import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/shimmer_container.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const CustomImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage =
        imagePath.startsWith('http') || imagePath.startsWith('https');

    return isNetworkImage
        ? _networkImage(context)
        // ? Image.network(
        //     imagePath,
        //     height: height,
        //     width: width,
        //     fit: fit,
        //     color: color,
        //     errorBuilder: (context, error, stackTrace) {
        //       return Container(
        //         height: height,
        //         width: width,
        //         decoration: const BoxDecoration(
        //           color: AppColors.gray,
        //         ),
        //         child: Center(
        //           child: Text(
        //             "Failed loading image",
        //             style: Get.context!.lable12400,
        //           ),
        //         ),
        //       );
        //     },
        //     loadingBuilder: (context, child, loadingProgress) {
        //       if (loadingProgress == null) return child;
        //       return Center(
        //         child: CircularProgressIndicator(
        //           value: loadingProgress.expectedTotalBytes != null
        //               ? loadingProgress.cumulativeBytesLoaded /
        //                   loadingProgress.expectedTotalBytes!
        //               : null,
        //         ),
        //       );
        //       // if (loadingProgress == null) {
        //       //   return child;
        //       // } else {
        //       // return ShimmerContainer(
        //       //   height: height ?? double.infinity,
        //       //   width: double.infinity,
        //       // );
        //       // }
        //     },
        //   )
        : Image.asset(
            imagePath,
            height: height,
            width: width,
            fit: fit,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  color: AppColors.gray,
                ),
                child: Center(
                  child: Text(
                    "Failed loading image",
                    style: Get.context!.lable12400,
                  ),
                ),
              );
            },
          );
  }

  _networkImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) {
        return ShimmerContainer(
          height: height ?? double.infinity,
          width: double.infinity,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.gray,
          ),
          child: Center(
            child: Text(
              "Failed loading image",
              style: Get.context!.lable12400,
            ),
          ),
        );
      },
    );
  }
}
