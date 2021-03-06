import 'package:cook_it/DatabaseHelper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:cook_it/models/product.dart';
import 'dart:async';
import 'package:cook_it/extentions/capitalize.dart';

class Fridge extends StatefulWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  List<Product> fridgeList = [];
  List<String> categoriesImage = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Product> productsList = await dbHelper.getProducts();
    List<String> productsCategories = await getImages(productsList);
    setState(
      () {
        fridgeList = productsList;
        categoriesImage = productsCategories;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState((){
      getData();
    });
    var scaffold = Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Fridge",
            style: TextStyle(
              fontFamily: "Comfort",
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.delete,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
              )),
        ],
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                fridgeList[index].product.capitalize(),
                style: const TextStyle(
                    fontFamily: "Comfort", color: Colors.white54, fontSize: 15),
              ),
              trailing: ImageIcon(
                AssetImage(categoriesImage[index]),
                color: Colors.white54,
                size: 30,
              ),
            ),
            color: Colors.grey[900],
          );
        },
        itemCount: fridgeList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/categories');
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.grey[900],
          size: 35,
        ),
      ),
    );
    return scaffold;
  }

  Future<List<String>> getImages(List<Product> productsList) async {
    List<String> productsCategories = [];
    for (int i = 0; i < productsList.length; i++) {
      if (productsList[i].category == "???????????? ??????????????" ||
          productsList[i].category == "Meat") {
        productsCategories.add("assets/images/category1.png");
      } else if (productsList[i].category == "????????" ||
          productsList[i].category == "Fish") {
        productsCategories.add("assets/images/category2.png");
      } else if (productsList[i].category == "???????????????? ????????????????" ||
          productsList[i].category == "Dairy products") {
        productsCategories.add("assets/images/category3.png");
      } else if (productsList[i].category == "????????" ||
          productsList[i].category == "Eggs") {
        productsCategories.add("assets/images/category4.png");
      } else if (productsList[i].category == "??????????" ||
          productsList[i].category == "Vegetables") {
        productsCategories.add("assets/images/category5.png");
      } else if (productsList[i].category == "????????????" ||
          productsList[i].category == "Fruits") {
        productsCategories.add("assets/images/category6.png");
      } else if (productsList[i].category == "???????????? ??????????????" ||
          productsList[i].category == "Flour products") {
        productsCategories.add("assets/images/category7.png");
      } else if (productsList[i].category == "??????????" ||
          productsList[i].category == "Cereals") {
        productsCategories.add("assets/images/category8.png");
      } else if (productsList[i].category == "????????????????" ||
          productsList[i].category == "Condiments") {
        productsCategories.add("assets/images/category9.png");
      } else if (productsList[i].category == "????????????????" ||
          productsList[i].category == "Sweets") {
        productsCategories.add("assets/images/category21.png");
      } else if (productsList[i].category == "???????????????????????????? ??????????????" ||
          productsList[i].category == "Soft drinks") {
        productsCategories.add("assets/images/category10.png");
      } else if (productsList[i].category == "?????????????? ????????????????" ||
          productsList[i].category == "Legumes") {
        productsCategories.add("assets/images/category11.png");
      } else if (productsList[i].category == "??????????" ||
          productsList[i].category == "Mushrooms") {
        productsCategories.add("assets/images/category12.png");
      } else if (productsList[i].category == "????????????????????????" ||
          productsList[i].category == "Seafood") {
        productsCategories.add("assets/images/category13.png");
      } else if (productsList[i].category == "????????" ||
          productsList[i].category == "Flour") {
        productsCategories.add("assets/images/category14.png");
      } else if (productsList[i].category == "?????????? ?? ??????????????" ||
          productsList[i].category == "Nuts and seeds") {
        productsCategories.add("assets/images/category15.png");
      } else if (productsList[i].category == "????????????????????" ||
          productsList[i].category == "Dried fruits") {
        productsCategories.add("assets/images/category16.png");
      } else if (productsList[i].category == "??????" ||
          productsList[i].category == "Cheese") {
        productsCategories.add("assets/images/category17.png");
      } else if (productsList[i].category == "??????????" ||
          productsList[i].category == "Berries") {
        productsCategories.add("assets/images/category18.png");
      } else if (productsList[i].category == "??????????" ||
          productsList[i].category == "Oils") {
        productsCategories.add("assets/images/category19.png");
      } else if (productsList[i].category == "????????????" ||
          productsList[i].category == "Others") {
        productsCategories.add("assets/images/category20.png");
      }
    }
    return productsCategories;
  }
}
