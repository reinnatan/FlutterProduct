import 'package:fluter_test_problem/entities/categori.dart';
import 'package:fluter_test_problem/presenters/product_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriWidget extends StatefulWidget {
  CategoriWidget({Key key}) : super(key: key);
  @override
  CategoriWidgetState createState() => new CategoriWidgetState();
}


class CategoriWidgetState extends State<CategoriWidget>{


  List<Categori> cat;
  Future<List<Categori>> categories;
  ProductPresenter presenter;

  @override
  void initState() {
    presenter = ProductPresenter();
    categories = presenter.categoriUseCase.getCategories();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(

        children: <Widget>[
          Expanded(
            child: SizedBox(
                child: FutureBuilder<List<Categori>>(
                    future: categories,
                    builder: (context, snapshot){
                      if(snapshot.hasData) {
                        cat = snapshot.data;
                        return setupCategoriList();
                      }else{
                        return Text("No data");
                      }
                      return CircularProgressIndicator();
                    }
                )
            ),
          ),
        ],

      ),
    );
  }

  setupCategoriList(){
    return ListView.builder(
        itemCount: cat.length,
        itemBuilder: (context, position){
          return Card(

              child: Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ID ${cat[position].id}", textAlign: TextAlign.left,),
                    Text("Name ${cat[position].name}")
                  ],
                ),
              )
          );
          //Text(products[position].name);
        });
  }
}