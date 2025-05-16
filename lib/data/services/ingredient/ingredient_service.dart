import 'package:proyecto/data/models/models.dart';

abstract class IngredientService {
  Future<int> createIngredient(IngredientModel ingredient);
  Future<List<IngredientModel>> getAllIngredients(String userId);
  Future<void> deleteIngredient(int id);
}
