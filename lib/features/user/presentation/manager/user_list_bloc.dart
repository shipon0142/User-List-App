import 'package:assignment/core/network/failure.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListUseCase useCase;
  UserListBloc({required this.useCase}) : super(UserListInitial()) {
    on<GetUsers>((event, emit) async {
      emit(UserListLoading());
      Either<Failure, List<User>> result = await useCase(page: 1, perPage: 10);
      result.fold(
          (l) => emit(
                UserListError(
                  errorCode: l.code,
                  errorStatus: l.status,
                  errorMessage: l.message,
                ),
              ), (r) {
        emit(UserListSuccess(users: r));
      });
    });
  }
}
