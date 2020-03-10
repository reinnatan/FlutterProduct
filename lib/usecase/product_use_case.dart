import 'package:fluter_test_problem/entities/product.dart';
import 'package:fluter_test_problem/usecase/product_base_use_case.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductUseCase implements ProductBaseUseCase{
  @override
  Future<List<Product>>getProductByCategoryId(String id) async {
    final responseProd = await http.get('http://www.mocky.io/v2/5e6624e83100006300239cd9');
    if (responseProd.statusCode == 200){

      List prodResponse = json.decode(responseProd.body);
      return prodResponse.map((prod)=> new Product.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load album");
    }
  }

  @override
  Future<List<Product>>getProductByName(String name) async {
    final responseProd = await http.get('http://www.mocky.io/v2/5e66265b310000ee81239cf0');
    if (responseProd.statusCode == 200){

      List prodResponse = json.decode(responseProd.body);
      return prodResponse.map((prod)=> new Product.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load album");
    }
  }

  Future<List<Product>>getProductByProductId(String id) async{
    final responseProd = await http.get('http://www.mocky.io/v2/5e6627543100005100239cf9');
    if (responseProd.statusCode == 200){

      List prodResponse = json.decode(responseProd.body);
      return prodResponse.map((prod)=> new Product.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load album");
    }
  }

  @override
  Future<List<Product>> sortProductBy(String sortBy) async{
      var url = "";
    if (sortBy=="product name"){
      url = "http://www.mocky.io/v2/5e662c1c3100006400239d21";

    }else if(sortBy=="price"){
      url ="http://www.mocky.io/v2/5e662cef3100006500239d26";
    }else{
      url ="http://www.mocky.io/v2/5e646b443400007f00338809";
    }

    final responseProd = await http.get(url);
    if (responseProd.statusCode == 200){
      List prodResponse = json.decode(responseProd.body);
      return prodResponse.map((prod)=> new Product.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load product");
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    final responseProd = await http.get('http://www.mocky.io/v2/5e646b443400007f00338809');
    if (responseProd.statusCode == 200){

      List prodResponse = json.decode(responseProd.body);
      return prodResponse.map((prod)=> new Product.fromJson(prod)).toList();
    }else{
      throw Exception("Failed to load product");
    }
  }




}