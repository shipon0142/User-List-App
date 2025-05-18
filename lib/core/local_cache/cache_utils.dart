import 'dart:async';
import 'dart:convert';
import 'package:code_base/core/utility/constants/constants_manager.dart';
import 'package:code_base/features/user/data/models/user_list_model/user_list_model.dart';
import 'package:code_base/features/user/domain/entity/user_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils {
  final SharedPreferences _prefs;
  static CacheUtils? _instance;

  CacheUtils._(this._prefs);

  static Future<CacheUtils> getInstance() async {
    if (_instance == null) {
      SharedPreferences cacheUtils = await SharedPreferences.getInstance();
      _instance = CacheUtils._(cacheUtils);
    }
    return _instance!;
  }

  saveUserList(UserList userList, String key) {
    final cacheData = {
      'timestamp': DateTime.now().toIso8601String(),
      'data': json.encode(userList),
    };
     _prefs.setString(key, jsonEncode(cacheData));
  }

  Future<UserList?> getUserList(String key) async{
    final jsonString = _prefs.getString(key);
    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString);
    final timestamp = DateTime.tryParse(jsonMap['timestamp'] ?? '');
    if (timestamp == null) return null;

    final isExpired = DateTime.now().difference(timestamp).inMinutes > AppConstants.cacheTimeOut.inMinutes;
    if (isExpired) return null;

    return UserListModel.fromJson(
      json.decode(jsonMap['data']),
    );
  }

  removeUserList(String key) {
    return _prefs.remove(key);
  }
}
