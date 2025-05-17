import 'package:assignment/core/di/di_import_path.dart';
import 'package:assignment/core/utility/constants/app_spacing.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/core/utility/constants/values_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:assignment/features/user/presentation/pages/user_card_widget.dart';
import 'package:assignment/features/user/presentation/pages/user_list_loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utility/constants/color_manager.dart';
import '../../../../core/utility/constants/screen_size.dart';
import '../pages/user_list_widget.dart';

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
                          hintText: 'Search ...',
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
                  if (((state is UserListLoading) ||
                          (state is UserListInitial)) &&
                      userBloc.getUserList.isEmpty) {
                    return UserListLoadingWidget();
                  }
                  return Flexible(
                    child: RefreshIndicator(
                      color: ColorManager.kColorOrange,
                      key: userBloc.refreshIndicatorKey,
                      onRefresh: () async {
                        userBloc.add(GetUsers());
                      },
                      child: SingleChildScrollView(
                        controller: userBloc.scrollController,
                        child: userBloc.getUserList.isNotEmpty
                            ? UserListWidget(userBloc: userBloc)
                            : SizedBox.shrink(),
                      ),
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
