import 'package:assignment/features/user/data/models/user_model/user_model.dart';
import 'package:assignment/features/user/domain/entity/user_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_model.freezed.dart';
part 'user_list_model.g.dart';

@freezed
class UserListModel extends UserList with _$UserListModel {
  const factory UserListModel({

    @JsonKey(name: "page") required int page,
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "total") required int total,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "data") @Default([]) List<UserModel> data,


  }) = _UserListModel;

  factory UserListModel.fromJson(Map<String, dynamic> json) => _$UserListModelFromJson(json);
}
