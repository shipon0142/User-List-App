import 'package:assignment/core/utility/constants/style_manager.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: getBoldStyle(),
        ),
      ),
      body: Container(),
    );
  }
}
