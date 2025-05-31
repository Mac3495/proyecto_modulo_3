import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/login/login_service.dart';
import 'package:proyecto/presentation/modules/login/login_module_notifiers.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';

// Mocks
class MockLoginService extends Mock implements LoginService {}

void main() {
  late LoginStateNotifier notifier;
  late MockLoginService mockLoginService;

  setUpAll(() {
    registerFallbackValue(
      UserModel(
        userName: 'dummy',
        userEmail: 'dummy@example.com',
        password: '123',
        rol: 'user',
      ),
    );
  });

  setUp(() {
    mockLoginService = MockLoginService();
    notifier = LoginStateNotifier(mockLoginService);
  });

  final testUser = UserModel(
    userName: 'Test',
    userEmail: 'test@example.com',
    password: '123456',
    rol: 'admin',
  );

  group('LoginStateNotifier', () {
    test('should emit loading then success when login is correct', () async {
      when(() => mockLoginService.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => testUser);

      final states = <ServiceResultGenericState<UserModel>>[];

      notifier.addListener((state) {
        states.add(state);
      });

      await notifier.login(testUser.userEmail, testUser.password);

      expect(states.length, 3);
      expect(states[0], const ServiceResultGenericState<UserModel>.init());
      expect(states[1], const ServiceResultGenericState<UserModel>.loading());
      expect(states[2], ServiceResultGenericState<UserModel>.success(testUser));
    });

    test('should emit loading then error when login fails', () async {
      when(() => mockLoginService.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenThrow(Exception('Usuario no registrado'));

      final states = <ServiceResultGenericState<UserModel>>[];

      notifier.addListener((state) {
        states.add(state);
      });

      await notifier.login('no@existe.com', 'clave');

      expect(states.length, 3);
      expect(states[0], const ServiceResultGenericState<UserModel>.init());
      expect(states[1], const ServiceResultGenericState<UserModel>.loading());
      expect(states[2], const ServiceResultGenericState<UserModel>.error('Exception: Usuario no registrado'));
    });

    test('should reset state to init', () {
      notifier.resetState();
      expect(notifier.state, const ServiceResultGenericState<UserModel>.init());
    });
  });
}
