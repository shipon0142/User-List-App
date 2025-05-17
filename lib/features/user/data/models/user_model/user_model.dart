import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  const factory UserModel({

    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "email") @Default('') String email,
    @JsonKey(name: "first_name") @Default('') String firstName,
    @JsonKey(name: "last_name") @Default('') String lastName,
    @JsonKey(name: "avatar") @Default('') String avatar,

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
