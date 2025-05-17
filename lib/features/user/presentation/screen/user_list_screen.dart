import 'package:assignment/core/di/di_import_path.dart';
import 'package:assignment/core/utility/constants/app_spacing.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/core/utility/constants/values_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utility/constants/color_manager.dart';
import '../../../../core/utility/constants/screen_size.dart';

@RoutePage()
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userBloc = injector<UserListBloc>();
    return Scaffold(
      backgroundColor: ColorManager.kColorWhite,
      body: BlocProvider.value(
        value: userBloc..add(GetUsers()),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpacing.verticalSpacing16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  spacing: AppSize.s8,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: ColorManager.kColorBlack,
                      size: 24,
                    ),
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {},
                        controller: userBloc.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search users...',
                          isDense: true,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpacing8,
              BlocBuilder<UserListBloc, UserListState>(
                builder: (context, state) {
                  return Flexible(
                    child: SingleChildScrollView(
                      controller: userBloc.scrollController,
                      child: userBloc.getUserList.isNotEmpty
                          ? Padding(
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
                                      return Container(
                                        padding: const EdgeInsets.all(16),
                                        // height: 84,
                                        width: screenMaxWidth(context: context),
                                        decoration: BoxDecoration(
                                          color: ColorManager.kF7F8FA,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                      );
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
                            )
                          : SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
