
import 'package:fluter_test_problem/entities/product.dart';
import 'package:fluter_test_problem/presenters/product_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProductWidget extends StatefulWidget {
  ProductWidget({Key key}) : super(key: key);
  @override
  ProductWidgetState createState() => new ProductWidgetState();
}


class ProductWidgetState extends State<ProductWidget>{
  List<DropdownMenuItem<String>> dropDownMenuItems;
  List<DropdownMenuItem<String>> dropDownMenuSort;
  String currentFilter;
  List filters = ["name", "category id", "product id"];
  List filterSort =["product name", "price", "product id"];
  String currentFilterSort;
  List<Product> prod;
  Future<List<Product>> products;
  ProductPresenter presenter;

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentFilter = dropDownMenuItems[0].value;

    dropDownMenuSort = getDropDownMenuSort();
    currentFilterSort = dropDownMenuSort[0].value;

    presenter = ProductPresenter();
    products = presenter.productUseCase.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("Category Pencarian", ),
              SizedBox(width: 10),
              DropdownButton(
                key: Key("category_search"),
                value: currentFilter,
                items: dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ]),


            TextField(
              key: Key("search_input"),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Cari Nama, Categori Id,  Product ID",
              ),
              onChanged: (text){
                    if(currentFilter=="name"){
                      setState(() {
                        if (text != "") {
                          products =
                              presenter.productUseCase.getProductByName(text);
                        } else {
                            products = presenter.productUseCase.getProducts();
                        }
                      });

                    }else if(currentFilter=="category id"){
                      setState(() {
                        if (text !=""){
                          products =  presenter.productUseCase.getProductByCategoryId(text);
                        }else{
                          products = presenter.productUseCase.getProducts();
                        }
                      });
                    }else if (currentFilter=="product id"){
                      setState(() {
                        if (text !=""){
                          products =  presenter.productUseCase.getProductByProductId(text);
                        }else{
                          products = presenter.productUseCase.getProducts();
                        }
                      });
                    }
              },
            ),

            Container(
              child: Row(children: <Widget>[
                Text("Sort By"),
                SizedBox(width: 10),
                DropdownButton(
                  key: Key("sort_by"),
                  value: currentFilterSort,
                  items: dropDownMenuSort,
                  onChanged: changedDropDownSort,
                )
              ],),
            ),

            Expanded(
              child: SizedBox(
                child: FutureBuilder<List<Product>>(
                    future: products,
                    builder: (context, snapshot){
                      if(snapshot.hasData) {
                        prod = snapshot.data;
                        return setupProductList();
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

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String filter in filters) {
      items.add(new DropdownMenuItem(
          value: filter,
          child: new Text(filter)
      ));
    }
    return items;
  }


  List<DropdownMenuItem<String>> getDropDownMenuSort() {
    List<DropdownMenuItem<String>> items = new List();
    for (String filter in filterSort) {
      items.add(new DropdownMenuItem(
          value: filter,
          child: new Text(filter)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedFilter) {
    setState(() {
      currentFilter = selectedFilter;
    });
  }

  void changedDropDownSort(String selectedFilter) {
    setState(() {
      currentFilterSort = selectedFilter;
      products = presenter.productUseCase.sortProductBy(selectedFilter);
    });
  }

  setupProductList(){
    return ListView.builder(
        itemCount: prod.length,
        itemBuilder: (context, position){
            return Card(

              child: Container(
                  padding: new EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("ID ${prod[position].id}", textAlign: TextAlign.left,),
                      Text("Name ${prod[position].name}"),
                      Text("Price ${prod[position].price}"),
                      Text("Category ${prod[position].category}"),
                    ],
                  ),
              )
            );
          //Text(products[position].name);
        });

  }

}