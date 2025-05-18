import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/utility/constants/app_spacing.dart';
import 'package:code_base/features/user/presentation/manager/user_list_bloc.dart';
import 'package:code_base/features/user/presentation/pages/user_list_loading_widget.dart';
import 'package:code_base/features/user/presentation/widgets/error_message_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utility/constants/color_manager.dart';
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
              _searchBar(userBloc),
              AppSpacing.verticalSpacing8,
              _userList(userBloc),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<UserListBloc, UserListState> _userList(UserListBloc userBloc) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        if (((state is UserListLoading) || (state is UserListInitial)) &&
            userBloc.getUserList.isEmpty) {
          return UserListLoadingWidget();
        } else if (state is UserListError) {
          return Column(
            children: [
              AppSpacing.verticalSpacing96,
              ErrorMessageWidget(
                  errorCode: state.errorCode, errorStatus: state.errorStatus),
            ],
          );
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
    );
  }

  Padding _searchBar(UserListBloc userBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }
}
