import 'package:assignment/features/user/domain/entity/user.dart';

class UserList {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  UserList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

}