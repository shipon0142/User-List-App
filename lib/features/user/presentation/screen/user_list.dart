import 'package:assignment/core/di/di_import_path.dart';
import 'package:assignment/core/utility/constants/app_spacing.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utility/constants/color_manager.dart';

@RoutePage()
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userBloc = injector<UserListBloc>();
    return BlocProvider.value(
      value: userBloc..add(GetUsers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User List',
            style: getBoldStyle(),
          ),
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: userBloc.scrollController,
              child: userBloc.getUserList.isNotEmpty
                  ? Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userBloc.getUserList.length,
                          itemBuilder: (_, index) {
                            User user = userBloc.getUserList[index];
                            return Card(
                              child: ListTile(
                                leading: Image.network(user.avatarUrl),
                                title: Text(user.login),
                              ),
                            );
                          }),
                      AppSpacing.verticalSpacing4,
                      if (userBloc.hasMore)
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
                  )
                  : SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
