import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{
  final _storage = GetStorage();
  final _key = "isDarkMode";

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  bool _loadTheme() => (_storage.read(_key)) ?? false;

  saveTheme(bool isDarkMode) {
    _storage.write(_key, isDarkMode);
  }

  changeTheme(ThemeData data){
    Get.changeTheme(data);
  }

  changeThemeMode(ThemeMode mode){
    Get.changeThemeMode(mode);
  }
}