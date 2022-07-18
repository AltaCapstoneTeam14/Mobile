import 'package:capstone_project/api/user_service.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([UserService])
void main() {
  group('UserService', () {
    UserService userService = UserService();

    test('get all user data', () async {
      var getData = await userService.getUser();
      when(getData.code!).thenAnswer(
        (_) => "200",
      );
      expect(getData.code!.isNotEmpty, true);
    });
  });
}
