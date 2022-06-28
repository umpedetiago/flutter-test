import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/controller/controller.dart';

void main() {
  late Controller controller;
  setUp(() {
    controller = Controller();
  });

  group("Controller Test", () {
    test("Instance of Controller is Valid", () {
      expect(controller, const TypeMatcher<Controller>());
    });

    test("Controller.isValidEmail - true", () {
      const email = "g@g.com";
      expect(controller.isValidEmail(email), isTrue, reason: "HFSDAGFyasfd");
    });

    test("Controller.isValidEmail - false", () {
      const email = "gg.com";
      expect(controller.isValidEmail(email), isFalse);
    });
  });
}
