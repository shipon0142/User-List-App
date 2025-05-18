import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/user/domain/entity/user.dart';
import 'package:code_base/features/user/domain/entity/user_list.dart';
import 'package:code_base/features/user/domain/repositories/i_user_repository.dart';
import 'package:dartz/dartz.dart';

class UserListUseCase {
  IUserRepository iRepository;

  UserListUseCase({required this.iRepository});

  Future<Either<Failure, UserList>> call({
    required int page,
    required int perPage,
  }) async => await iRepository.getUsers(page: page,perPage: perPage);
}
