abstract class LoginRepository {
  Future<Map<String, dynamic>> login(
      {required String email, required String password});
}

class LoginRepositoryImpl implements LoginRepository {
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
