// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:fluter_test_problem/entities/product.dart';
import 'package:fluter_test_problem/usecase/product_base_use_case.dart';
import 'package:fluter_test_problem/view/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAPI extends Mock implements ProductBaseUseCase{
  @override
  Future<List<Product>> sortProductBy(String sortBy) {
    // TODO: implement sortProductBy
    List<Product> temp = new List<Product>();
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    return new Future.value(temp);
  }

  @override
  Future<List<Product>> getProductByCategoryId(String id) {
    return throw Exception("Failed to load product");
  }

  @override
  Future<List<Product>> getProducts() {
    List<Product> temp = new List<Product>();
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    temp.add(new Product(1, "asd", "test", 2));
    return new Future.value(temp);
  }

  @override
  Future<List<Product>> getProductByName(String name) {
    List<Product> temp = new List<Product>();
    temp.add(new Product(1, "asd", "test", 2));
    return new Future.value(temp);
  }
}

void main() {
  testWidgets('Test Use Case Sort By', (WidgetTester tester) async {

    MockAPI useCase = MockAPI();
    useCase.sortProductBy("price").then((map){
      expect(map.length, isNotNull);
    });
  });


  testWidgets('Test Use Case Product Categori ID When generate null', (WidgetTester tester) async {
    MockAPI useCase = MockAPI();
    Future<List<Product>> listProd = useCase.getProductByProductId("1");
    expect(listProd, null);
  });


  testWidgets('Test Use Case Product get products if null', (WidgetTester tester) async {
    MockAPI useCase = MockAPI();
    Future<List<Product>> listProd = useCase.getProducts();
    expect(listProd, isNotNull);
  });


  testWidgets('Test Use Case Product get products by name', (WidgetTester tester) async {
    MockAPI useCase = MockAPI();
    useCase.getProductByName("coba").then((map){
      expect(map.length, isNotNull);
    });
  });

}
