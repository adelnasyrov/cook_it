import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/models/recipe_category_global.dart';
import 'package:cook_it/widgets/recipe_global_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/database_helper.dart';
import '../../widgets/recipe_global_category_disabled.dart';
import '../../widgets/search_delegate2.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<RecipeCategoryGlobal> categoriesList = [];
  List<Recipe> suggestionList = [];

  bool waiting = true;

  loadingAsyncTask() async {
    await getData();

    setState(() {
      waiting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadingAsyncTask();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<RecipeCategoryGlobal> categoryList =
        await dbHelper.getRecipeCategoriesGlobal();
    List<Recipe> suggestions = await dbHelper.getAllRecipes();
    setState(
      () {
        categoriesList = categoryList;
        suggestionList = suggestions;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "catalog".tr,
            style: TextStyle(
              fontFamily: "Comfort",
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate2(suggestionList));
                },
              ),
            )
          ],
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: waiting
            ? Center(
          child:
          CircularProgressIndicator(color: Colors.deepOrangeAccent),
        )
            : Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeGlobalCategory(
                          category: categoriesList[0],
                          image_address:
                          "assets/images/global_categories/categ_1.jpg"),
                      RecipeGlobalCategory(
                          category: categoriesList[2],
                          image_address:
                          "assets/images/global_categories/categ_3.jpg"),
                      RecipeGlobalCategoryDisabled(
                                category: categoriesList[4],
                                image_address:
                                    "assets/images/global_categories/categ_5.jpg"),
                      RecipeGlobalCategoryDisabled(
                                category: categoriesList[6],
                                image_address:
                                    "assets/images/global_categories/categ_7.jpg"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeGlobalCategory(
                          category: categoriesList[1],
                          image_address:
                          "assets/images/global_categories/categ_2.jpg"),
                      RecipeGlobalCategory(
                          category: categoriesList[3],
                          image_address:
                          "assets/images/global_categories/categ_4.jpg"),
                      RecipeGlobalCategoryDisabled(
                                category: categoriesList[5],
                                image_address:
                                    "assets/images/global_categories/categ_6.jpg"),
                      RecipeGlobalCategoryDisabled(
                                category: categoriesList[7],
                                image_address:
                                    "assets/images/global_categories/categ_8.jpg"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
