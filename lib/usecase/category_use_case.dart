import 'dart:convert';

import 'package:fluter_test_problem/entities/categori.dart';
import 'package:fluter_test_problem/usecase/category_base_use_case.dart';
import 'package:http/http.dart' as http;

class CategoriUseCase implements CategoryBaseUseCase{
  @override
  Future<List<Categori>> getCategories() async {
    final responseCat = await http.get('http://www.mocky.io/v2/5e663f163100006500239e07');
    if (responseCat.statusCode == 200){

      List catResponse = json.decode(responseCat.body);
      return catResponse.map((prod)=> new Categori.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load album");
    }
  }
}