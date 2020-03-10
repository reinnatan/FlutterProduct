import 'package:fluter_test_problem/entities/product.dart';

abstract class ProductBaseUseCase{
  Future<List<Product>>getProducts();
  Future<List<Product>>getProductByName(String name);
  Future<List<Product>>getProductByCategoryId(String id);
  Future<List<Product>>getProductByProductId(String id);
  Future<List<Product>>sortProductBy(String sortBy);
}