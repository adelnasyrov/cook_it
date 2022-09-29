import 'package:flutter/material.dart';

import '../../models/recipe.dart';

class ProteinsCard extends StatelessWidget {
  Recipe recipe;

  ProteinsCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text("Белки",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Comfort", fontSize: 12),
                  textAlign: TextAlign.center)),
          Image.asset(
            'assets/images/proteins.png',
            height: 24,
            width: 24,
            color: Colors.white54,
            fit: BoxFit.cover,
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(recipe.proteins.toString() + " г/100г",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Comfort", fontSize: 12),
                  textAlign: TextAlign.center)),
        ]),
        color: Colors.grey[800],
      ),
    );
  }
}
