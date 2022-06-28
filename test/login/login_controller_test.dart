import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/login/login_controller.dart';
import 'package:testapp/login/login_repository.dart';

class LoginRepositoryMock extends LoginRepository {
  @override
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    if (email == "g@g.com" && password == "123456") {
      return {"name": "Gabul"};
    } else {
      throw Exception("Usuario e/ou inválidos");
    }
  }
}

void main() {
  late LoginController controller;
  late LoginRepository repository;
  setUp(() {
    repository = LoginRepositoryMock();
    controller = LoginController(repository: repository);
  });

  group("LoginController Test", () {
    test("Instance of LoginController is Valid", () {
      expect(controller, const TypeMatcher<LoginController>());
    });

    test("Controller.isValidEmail - true", () {
      const email = "g@g.com";
      expect(controller.isValidEmail(email), isTrue, reason: "HFSDAGFyasfd");
    });

    test("Controller.isValidEmail - false", () {
      const email = "gg.com";
      expect(controller.isValidEmail(email), isFalse);
    });

    test("Controller.login - true", () async {
      const email = "g@g.com";
      const password = "123456";
      controller.onChange(email: email, password: password);
      expect(controller.email, email);
      expect(controller.password, password);
      final response = await controller.login();
      expect(response, isTrue);
    });
  });
}
