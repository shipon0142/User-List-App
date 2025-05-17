import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "login") @Default('') String login,
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "node_id") @Default('') String nodeId,
    @JsonKey(name: "avatar_url") @Default('') String avatarUrl,
    @JsonKey(name: "gravatar_id") @Default('') String gravatarId,
    @JsonKey(name: "url") @Default('') String url,
    @JsonKey(name: "html_url") @Default('') String htmlUrl,
    @JsonKey(name: "followers_url") @Default('') String followersUrl,
    @JsonKey(name: "following_url") @Default('') String followingUrl,
    @JsonKey(name: "gists_url") @Default('') String gistsUrl,
    @JsonKey(name: "starred_url") @Default('') String starredUrl,
    @JsonKey(name: "subscriptions_url") @Default('') String subscriptionsUrl,
    @JsonKey(name: "organizations_url") @Default('') String organizationsUrl,
    @JsonKey(name: "repos_url") @Default('') String reposUrl,
    @JsonKey(name: "events_url") @Default('') String eventsUrl,
    @JsonKey(name: "received_events_url") @Default('') String receivedEventsUrl,
    @JsonKey(name: "type") @Default('') String type,
    @JsonKey(name: "user_view_type") @Default('') String userViewType,
    @JsonKey(name: "site_admin") @Default(false) bool siteAdmin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
