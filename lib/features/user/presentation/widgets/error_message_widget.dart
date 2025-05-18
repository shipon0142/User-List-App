import 'package:code_base/core/utility/constants/app_spacing.dart';
import 'package:code_base/core/utility/constants/asset_manger.dart';
import 'package:code_base/core/utility/constants/color_manager.dart';
import 'package:code_base/core/utility/constants/font_manager.dart';
import 'package:code_base/core/utility/constants/style_manager.dart';
import 'package:code_base/core/utility/constants/values_manager.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final int errorCode;
  final String errorStatus;

  const ErrorMessageWidget(
      {super.key, required this.errorCode, required this.errorStatus});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.errorIcon,
            height: AppSize.s100,
            width: AppSize.s100,
            fit: BoxFit.cover,
          ),
          AppSpacing.verticalSpacing24,
          Text(
            errorCode.toString(),
            style: getBoldStyle(
              fontSize: FontSize.s24,
            ),
          ),
          AppSpacing.verticalSpacing8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p42),
            child: Text(
              errorStatus,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                color: ColorManager.k121212,
                fontSize: FontSize.s18,
              ),
            ),
          ),
          AppSpacing.verticalSpacing24,
        ],
      ),
    );
  }
}
