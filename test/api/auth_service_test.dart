import 'package:capstone_project/Model/Login/Request/login_model.dart';
import 'package:capstone_project/Model/Login/Response/login_response.dart';
import 'package:capstone_project/Model/Register/Request/register_model.dart';
import 'package:capstone_project/Model/Register/Response/register_response.dart';
import 'package:capstone_project/api/auth_service.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  group('UserService', () {
    AuthService authService = MockAuthService();

    final dataLogin = LoginModel(
      email: "test@gmail.com",
      password: "password",
    );

    final dataRegister = RegisterModel(
      name: 'name',
      email: 'email',
      password: 'password',
      phone: 'phone',
    );

    test('Login Data', () async {
      when(authService.login(dataLogin)).thenAnswer(
        (_) async => LoginResponse(
          timestamp: 'timestamp',
          code: 'code',
          message: 'message',
          data: {'token': 'token'},
        ),
      );

      var token = await authService.login(dataLogin);
      expect(token!.data!.isNotEmpty, true);
    });

    test('Register Data', () async {
      when(authService.register(dataRegister)).thenAnswer(
        (_) async => RegisterResponse(
          timestamp: 'timestamp',
          code: 'code',
          message: 'message',
        ),
      );

      var getData = await authService.register(dataRegister);
      expect(getData!.message.isNotEmpty, true);
    });
  });
}
