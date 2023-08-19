import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  //单例生命
  factory AppSharedPreferences() => _instance;
  AppSharedPreferences._internal();
  static final AppSharedPreferences _instance = AppSharedPreferences._internal();
  //保持一个SharedPreferences的引用
  static late final SharedPreferences _prefs;
  //初始化方法，只需要调用一次。
  static Future<AppSharedPreferences> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return _instance;
  }


  // 存储数据
   static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // 读取数据
  static String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }


  // 存储其他类型的数据（整数、布尔值等）
  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  // List封装
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _prefs.getStringList(key) ?? defaultValue;
  }
  //封装map
  static Future<void> setMap(String key, Map<String, dynamic> value) async {
    String jsonString = json.encode(value);
    await _prefs.setString(key, jsonString);
  }

  static Map<String, dynamic> getMap(String key,
      {Map<String, dynamic> defaultValue = const {}}) {
    String jsonString = _prefs!.getString(key) ?? '';
    if (jsonString.isNotEmpty) {
      return json.decode(jsonString);
    }
    return defaultValue;
  }

  // 删除数据
  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  /// 获取数据中所有的key
  static Set<String> getKeys() {
    return _prefs.getKeys();
  }

  /// 判断数据中是否包含某个key
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  /// 清除所有数据
  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// 重新加载
  static Future<void> reload() async {
    return await _prefs.reload();
  }
}
//使用方法
// AppSharedPreferences prefs = await AppSharedPreferences.getInstance();

// // 存储数据
// prefs.setString('username', 'John');

// // 读取数据
// String username = prefs.getString('username');

// // 删除数据
// prefs.remove('username');




//map的使用方法
// AppSharedPreferences prefs = await AppSharedPreferences.getInstance();

// Map<String, dynamic> userData = {
//   'username': 'John',
//   'age': 30,
//   'isPremium': true,
// };

// prefs.setMap('user', userData);

// Map<String, dynamic> storedUserData = prefs.getMap('user');
// print(storedUserData); // {'username': 'John', 'age': 30, 'isPremium': true}
