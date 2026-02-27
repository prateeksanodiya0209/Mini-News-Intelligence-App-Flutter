import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false) {
    _loadLoginState();
  }

  final Box box = Hive.box('auth');

  void _loadLoginState() {
    state = box.get('isLoggedIn', defaultValue: false);
  }

  void login(String username) {
    box.put('isLoggedIn', true);
    box.put('username', username);
    state = true;
  }

  void logout() {
    box.put('isLoggedIn', false);
    state = false;
  }

  String get username => box.get('username', defaultValue: '');
}