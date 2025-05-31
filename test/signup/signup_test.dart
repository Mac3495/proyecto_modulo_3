import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/user/user_service.dart';
import 'package:proyecto/core/preferences/app_preferences.dart';
import 'package:proyecto/presentation/modules/signup/signup_module_notifiers.dart';

// Mocks
class MockUserService extends Mock implements UserService {}

class MockAppPreferences extends Mock implements AppPreferences {}

void main() {
  late SignupStateNotifier notifier;
  late MockUserService mockUserService;
  late MockAppPreferences mockPrefs;

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
    mockUserService = MockUserService();
    mockPrefs = MockAppPreferences();
    notifier = SignupStateNotifier(userService: mockUserService, prefs: mockPrefs);
  });

  final user = UserModel(
    userName: 'Test User',
    userEmail: 'test@example.com',
    password: '123456',
    rol: 'admin',
  );

  group('SignupStateNotifier', () {
    test('should emit loading then success when createUser succeeds', () async {
      when(() => mockUserService.createUser(any())).thenAnswer((_) async => 1);
      when(() => mockPrefs.saveString(key: any(named: 'key'), value: any(named: 'value')))
          .thenAnswer((_) async => true);

      final states = <SignupStates>[];

      // Listener para observar los cambios de estado
      notifier.addListener((state) {
        states.add(state.state);
      });

      await notifier.createUser(user);

      expect(states, [SignupStates.init, SignupStates.loading, SignupStates.success]);
      verify(() => mockUserService.createUser(user)).called(1);
      verify(() => mockPrefs.saveString(key: any(named: 'key'), value: '1')).called(1);
    });

    test('should emit loading then error when createUser throws', () async {
      when(() => mockUserService.createUser(any())).thenThrow(Exception('DB error'));

      final states = <SignupStates>[];

      notifier.addListener((state) {
        states.add(state.state);
      });

      await notifier.createUser(user);

      expect(states, [SignupStates.init, SignupStates.loading, SignupStates.error]);
      verify(() => mockUserService.createUser(user)).called(1);
    });
  });
}
