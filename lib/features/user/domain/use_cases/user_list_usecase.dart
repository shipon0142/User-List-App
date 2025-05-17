import 'package:assignment/core/network/failure.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/repositories/i_user_repository.dart';
import 'package:dartz/dartz.dart';

class UserListUseCase {
  IUserRepository iRepository;

  UserListUseCase({required this.iRepository});

  Future<Either<Failure, List<User>>> call({
    required int page,
    required int perPage,
  }) async => await iRepository.getUsers();
}
