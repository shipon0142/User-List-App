import 'package:assignment/core/utility/constants/app_spacing.dart';
import 'package:assignment/core/utility/constants/color_manager.dart';
import 'package:assignment/core/utility/constants/font_manager.dart';
import 'package:assignment/core/utility/constants/screen_size.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/core/utility/constants/values_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: SizedBox(
            height: 40,
            width: 40,
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: ColorManager.kColorBlack,
                size: 24,
              ),
            ),
          ),
        ),
        backgroundColor: ColorManager.kColorWhite,
        scrolledUnderElevation: 0,
        title: Text(
          'Details',
          style: getBoldStyle(
            color: ColorManager.kColorBlack,
            fontSize: FontSize.s16,
          ),
        ),
      ),
      backgroundColor: ColorManager.kColorWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
          top: AppPadding.p16,
        ),
        child: _buildProfileContent(user, context),
      ),
    );
  }

  Widget _buildProfileContent(User user, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileHeader(user),
        AppSpacing.verticalSpacing8,
        dataCard(key: 'First Name', value: user.firstName, context: context),
        AppSpacing.verticalSpacing8,
        dataCard(key: 'Last Name', value: user.lastName, context: context),
        AppSpacing.verticalSpacing8,
      ],
    );
  }

  Widget _buildProfileHeader(User user) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorManager.kF7F8FA,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            AppSpacing.verticalSpacing32,
            _buildAvatar(),
            AppSpacing.verticalSpacing8,
            Text(
              user.email,

              style: getRegularStyle(
                color: ColorManager.kColorBlack,
                fontSize: FontSize.s16
              ),
            ),
            AppSpacing.verticalSpacing32,
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
        height: 80,
        width: 80,
        child: CircleAvatar(
          radius: 54,
          backgroundImage: NetworkImage(user.avatar),
        ));
  }

  Container dataCard(
      {required String key, String? value, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(16),
      // height: 84,
      width: screenMaxWidth(context: context),
      decoration: BoxDecoration(
        color: ColorManager.kF7F8FA,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            key,
            style: getSemiBoldStyle(
              fontSize: 16,
              color: ColorManager.k121212,
            ),
          ),
          AppSpacing.verticalSpacing8,
          Text(
            value ?? '',
            style: getRegularStyle(
              color: ColorManager.k181818,
            ),
          ),
        ],
      ),
    );
  }
}
