import 'package:fluter_test_problem/usecase/category_use_case.dart';
import 'package:fluter_test_problem/usecase/product_use_case.dart';
import 'package:flutter/material.dart';

class ProductPresenter {
  ProductUseCase productUseCase;
  CategoriUseCase categoriUseCase;

  ProductPresenter(){
    categoriUseCase = CategoriUseCase();
    productUseCase = ProductUseCase();
  }
}
