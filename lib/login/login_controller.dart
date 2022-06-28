import 'package:testapp/login/login_repository.dart';

class LoginController {
  final LoginRepository repository;
  String email = "";
  String password = "";
  LoginController({
    required this.repository,
  });

  bool isValidEmail(String email) => email.contains("@");
  bool isValidPassword(String password) => password.length >= 6;

  void onChange({String? email, String? password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
  }

  Future<bool> login() async {
    try {
      await repository.login(email: email, password: password);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
