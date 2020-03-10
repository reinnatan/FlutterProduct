import 'package:fluter_test_problem/entities/categori.dart';

abstract class CategoryBaseUseCase{
  Future<List<Categori>>getCategories();
}
