import 'package:assignment/core/utility/constants/app_spacing.dart';
import 'package:assignment/core/utility/constants/color_manager.dart';
import 'package:assignment/core/utility/constants/screen_size.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/core/utility/constants/values_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:assignment/features/user/presentation/pages/user_card_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.userBloc,
  });

  final UserListBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        children: [
          ListView.separated(
            physics:
            const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userBloc.getUserList.length,
            itemBuilder: (_, index) {
              User user = userBloc.getUserList[index];
              return UserCard(user: user);
            },
            separatorBuilder:
                (BuildContext context, int index) {
              return AppSpacing.verticalSpacing8;
            },
          ),
          AppSpacing.verticalSpacing4,
          if (userBloc.isLoadingMore())
            Center(
              child: Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.kColorOrange,
                    ),
                  )
                ],
              ),
            ),
          AppSpacing.verticalSpacing8,
        ],
      ),
    );
  }
}
