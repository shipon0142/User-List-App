import 'package:code_base/core/utility/constants/color_manager.dart';
import 'package:code_base/core/utility/constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerBg extends StatelessWidget {
  const ShimmerBg({
    super.key,
    this.width = double.maxFinite,
    this.height = 25,
    this.radius = AppRadius.r10,
    this.color,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: kLightGreyColor,
      baseColor: ColorManager.kF7F8FA,
      highlightColor: ColorManager.kEDF2FA,
      // highlightColor: kGreyColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppRadius.r18),
          color: color ?? ColorManager.kF4ECFF,
        ),
      ),
    );
  }
}