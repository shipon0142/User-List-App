part of 'user_list_bloc.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListError extends UserListState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const UserListError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class UserListSuccess extends UserListState {
  final List<User> users;

  const UserListSuccess({required this.users});
}

class MoreUserListLoading extends UserListState {}

class MoreUserListError extends UserListState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const MoreUserListError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class MoreUserListSuccess extends UserListState {
  final List<User> users;

  const MoreUserListSuccess({required this.users});
}
class SearchingUserList extends UserListState {
  const SearchingUserList();
}

class SearchUserListSuccess extends UserListState {
  final List<User> users;

  const SearchUserListSuccess({required this.users});
}
