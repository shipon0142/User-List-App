import 'dart:async';
import 'package:code_base/core/utility/debouncer/debouncer.dart';
import 'package:code_base/features/user/domain/entity/user.dart';
import 'package:code_base/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListUseCase useCase;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final _debouncer = Debouncer(delay: Duration(milliseconds: 300));

  final List<User> _userList = []; // Holds all fetched users
  final List<User> _userListSearch = []; // Holds filtered users based on search
  int _page = 1;
  final int _perPage = 10;
  bool hasMore = false;
  bool _isFetching = false;

  List<User> get getUserList =>
      searchController.text.isNotEmpty ? _userListSearch : _userList;

  UserListBloc({required this.useCase}) : super(UserListInitial()) {
    scrollController.addListener(_onScroll);
    searchController.addListener(_onSearchChanged);

    on<GetUsers>(_onGetUsers);
    on<GetMoreUsers>(_onGetMoreUsers);
    on<GetSearchUsers>(_onGetSearchUsers);
  }

  void _onSearchChanged() {
    _debouncer(() {
      add(GetSearchUsers());
    });
  }

  bool isLoadingMore() {
    return hasMore && searchController.text.isEmpty;
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      if (hasMore && !_isFetching) {
        _debouncer(() {
          add(GetMoreUsers()); // Prevents frequent fetches
        });
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
      (response) {
        _userList.addAll(response.data);
        if (response.page < response.totalPages) {
          hasMore = true;
        } else {
          hasMore = false;
        }
        emit(UserListSuccess(users: _userList));
      },
    );
  }

  Future<void> _onGetMoreUsers(
      GetMoreUsers event, Emitter<UserListState> emit) async {
    if (_isFetching || !hasMore) return;
    if (searchController.text.isNotEmpty) {
      return; //Skip pagination during search
    }

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
      (response) {
        if (response.data.isEmpty) {
          hasMore = false;
        } else {
          _userList.addAll(response.data);
          if (response.page < response.totalPages) {
            hasMore = true;
          } else {
            hasMore = false;
          }
          emit(MoreUserListSuccess(users: response.data));
        }
      },
    );

    _isFetching = false;
  }

  Future<void> _onGetSearchUsers(
      GetSearchUsers event, Emitter<UserListState> emit) async {
    final text = searchController.text;
    emit(SearchingUserList());
    if (text.isNotEmpty) {
      _userListSearch.clear(); // Clean state on fresh load
      _userListSearch.addAll(
        _userList.where((user) => '${user.firstName}${user.lastName}'
            .toLowerCase()
            .contains(text.toLowerCase().toString())),
      );
      emit(SearchUserListSuccess(users: _userListSearch));
    } else {
      _userListSearch.clear();
      emit(UserListSuccess(users: _userList));
    }
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    return super.close();
  }
}
