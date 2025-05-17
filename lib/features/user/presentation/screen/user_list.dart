import 'package:assignment/core/di/di_import_path.dart';
import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<UserListBloc>()..add(GetUsers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User List',
            style: getBoldStyle(),
          ),
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UserListLoading) {
              return const CircularProgressIndicator();
            } else if (state is UserListError) {
              return Center(child: Text(state.errorMessage));
            } else if(state is UserListSuccess){

              return ListView.builder(
                shrinkWrap: true,
                  itemCount: state.users.length,
                  itemBuilder: (_, index){
                User user = state.users[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(user.avatarUrl),
                    title: Text(user.login),
                  ),
                );
              });
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
