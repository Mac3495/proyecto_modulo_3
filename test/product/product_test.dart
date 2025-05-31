import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service.dart';
import 'package:proyecto/presentation/modules/product/product_module_notifiers.dart';

// Mocks
class MockIngredientService extends Mock implements IngredientService {}

void main() {
  late ProductStateNotifier notifier;
  late MockIngredientService mockService;

  setUpAll(() {
    registerFallbackValue(
      IngredientModel(
        name: 'dummy',
        userId: 'test',
      ),
    );
  });

  setUp(() {
    mockService = MockIngredientService();
    notifier = ProductStateNotifier(mockService);
  });

  final ingredient = IngredientModel(
    name: 'Azúcar',
    userId: 'usuario123',
  );

  group('ProductStateNotifier', () {
    test('createIngredients should emit loading then success', () async {
      when(() => mockService.createIngredient(any())).thenAnswer((_) async => 1);

      final states = <ServiceResultGenericState<void>>[];
      notifier.addListener((state) => states.add(state));

      await notifier.createIngredients(ingredient);

      expect(states[0], const ServiceResultGenericState<void>.init());
      expect(states[1], const ServiceResultGenericState<void>.loading());
      expect(states[2], const ServiceResultGenericState<void>.success(null));
      verify(() => mockService.createIngredient(ingredient)).called(1);
    });

    test('createIngredients should emit loading then error', () async {
      when(() => mockService.createIngredient(any()))
          .thenThrow(Exception('Fallo en creación'));

      final states = <ServiceResultGenericState<void>>[];
      notifier.addListener((state) => states.add(state));

      await notifier.createIngredients(ingredient);

      expect(states[0], const ServiceResultGenericState<void>.init());
      expect(states[1], const ServiceResultGenericState<void>.loading());
      expect(states[2],
          const ServiceResultGenericState<void>.error('Exception: Fallo en creación'));
    });

    test('deleteIngredient should emit loading then success', () async {
      when(() => mockService.deleteIngredient(any())).thenAnswer((_) async => Future.value());

      final states = <ServiceResultGenericState<void>>[];
      notifier.addListener((state) => states.add(state));

      await notifier.deleteIngredient(1);

      expect(states[0], const ServiceResultGenericState<void>.init());
      expect(states[1], const ServiceResultGenericState<void>.loading());
      expect(states[2], const ServiceResultGenericState<void>.success(null));
      verify(() => mockService.deleteIngredient(1)).called(1);
    });

    test('deleteIngredient should emit loading then error', () async {
      when(() => mockService.deleteIngredient(any()))
          .thenThrow(Exception('No se pudo borrar'));

      final states = <ServiceResultGenericState<void>>[];
      notifier.addListener((state) => states.add(state));

      await notifier.deleteIngredient(1);

      expect(states[0], const ServiceResultGenericState<void>.init());
      expect(states[1], const ServiceResultGenericState<void>.loading());
      expect(states[2],
          const ServiceResultGenericState<void>.error('Exception: No se pudo borrar'));
    });

    test('resetState should set state to init', () {
      notifier.resetState();
      expect(notifier.state, const ServiceResultGenericState<void>.init());
    });
  });
}
