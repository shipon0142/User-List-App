import 'package:code_base/config/routes/app_router.gr.dart';
import 'package:code_base/core/utility/constants/app_spacing.dart';
import 'package:code_base/core/utility/constants/color_manager.dart';
import 'package:code_base/core/utility/constants/screen_size.dart';
import 'package:code_base/core/utility/constants/style_manager.dart';
import 'package:code_base/features/user/domain/entity/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(UserDetailsRoute(user: user));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        // height: 84,
        width: screenMaxWidth(context: context),
        decoration: BoxDecoration(
          color: ColorManager.kF7F8FA,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: user.avatar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Text(
              '${user.firstName} ${user.lastName}',
              style: getSemiBoldStyle(
                fontSize: 16,
                color: ColorManager.k121212,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
