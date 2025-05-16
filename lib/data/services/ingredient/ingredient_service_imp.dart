import 'package:proyecto/data/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'ingredient_service.dart';

class IngredientServiceImpl implements IngredientService {
  final Database db;

  IngredientServiceImpl(this.db);

  @override
  Future<int> createIngredient(IngredientModel ingredient) async {
    final map = ingredient.toJson();
    map.remove('id');
    return await db.insert('ingredients', map);
  }

  @override
  Future<List<IngredientModel>> getAllIngredients(String userId) async {
    final result = await db.query(
      'ingredients',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return result.map((e) => IngredientModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteIngredient(int id) async {
    await db.delete('ingredients', where: 'id = ?', whereArgs: [id]);
  }
}
