import 'dart:async';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListUseCase useCase;
  final ScrollController scrollController = ScrollController();

  final List<User> _userList = [];
  int _page = 1;
  final int _perPage = 15;
  bool hasMore = false;
  bool _isFetching = false;

  List<User> get getUserList => _userList;

  UserListBloc({required this.useCase}) : super(UserListInitial()) {
    scrollController.addListener(_onScroll);

    on<GetUsers>(_onGetUsers);
    on<GetMoreUsers>(_onGetMoreUsers);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      if (hasMore && !_isFetching) {
        add(GetMoreUsers());
      }
    }
  }

  Future<void> _onGetUsers(GetUsers event, Emitter<UserListState> emit) async {
    _page = 1;
    _userList.clear();
    hasMore = false;

    emit(UserListLoading());

    final result = await useCase(page: _page, perPage: _perPage);
    result.fold(
          (failure) => emit(UserListError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
          (users) {
        _userList.addAll(users);
        hasMore = users.length == _perPage;
        emit(UserListSuccess(users: _userList));
      },
    );
  }

  Future<void> _onGetMoreUsers(
      GetMoreUsers event, Emitter<UserListState> emit) async {
    if (_isFetching || !hasMore) return;

    _isFetching = true;
    _page++;
    emit(MoreUserListLoading());

    final result = await useCase(page: _page, perPage: _perPage);
    result.fold(
          (failure) {
        hasMore = false;
        emit(MoreUserListError(
          errorCode: failure.code,
          errorStatus: failure.status,
          errorMessage: failure.message,
        ));
      },
          (users) {
        if (users.isEmpty) {
          hasMore = false;
        } else {
          _userList.addAll(users);
          hasMore = users.length == _perPage;
          emit(MoreUserListSuccess(users: users));
        }
      },
    );

    _isFetching = false;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
