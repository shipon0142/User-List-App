import 'package:code_base/core/presentation/widgets/shimmer/shimmer_bg.dart';
import 'package:code_base/core/utility/constants/app_spacing.dart';
import 'package:code_base/core/utility/constants/values_manager.dart';
import 'package:flutter/material.dart';

class UserListLoadingWidget extends StatelessWidget {
  const UserListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p16),
          child: Column(
            children: [
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
              ShimmerBg(height: AppSize.s70, radius: AppRadius.r8),
              AppSpacing.verticalSpacing8,
            ],
          ),
        ),
      ),
    );
  }
}
