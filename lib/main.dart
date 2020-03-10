import 'package:fluter_test_problem/view/categori_list.dart';
import 'package:fluter_test_problem/view/product_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ProductCategories());

class ProductCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.access_alarm)),
                Tab(icon: Icon(Icons.ac_unit))
              ],
            ),
            title: Text('Product Category Demo'),
          ),
          body: TabBarView(
            children: [
              ProductWidget(),
              CategoriWidget()
            ],
          ),
        ),
      ),
    );

  }
}


