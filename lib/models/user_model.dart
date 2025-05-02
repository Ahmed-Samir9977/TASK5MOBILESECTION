import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _imagePath;

  UserModel({String imagePath = 'assets/profile1.jpg'}) : _imagePath = imagePath;

  String get imagePath => _imagePath;

  void setImagePath(String newPath) {
    _imagePath = newPath;
    notifyListeners(); // Notifies widgets to rebuild
  }
}
