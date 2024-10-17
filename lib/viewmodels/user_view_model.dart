import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewModel with ChangeNotifier {
  UserRepository _userRepository = UserRepository();

  Future<void> registerUser(User user) async {
    await _userRepository.registerUser(user);
  }

  Future<User?> loginUser(String username, String password) async {
    return await _userRepository.loginUser(username, password);
  }
}
