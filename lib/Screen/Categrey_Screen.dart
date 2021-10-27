import 'package:flutter/material.dart';
import '../widget/Category_Item.dart';

import '../app_date.dart';
class CategreyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'AroundYou App',
//          style: TextStyle(
//            fontSize: 25,
//
//          ),
//        ),
//        backgroundColor: Colors.orangeAccent,
//      ),
      backgroundColor: Colors.white,
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
        mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          
        ),
        children:
          Catrgory_date.map(
              (Category)=>CategoryItem(title: Category.name,image: Category.image,id: Category.id,),
          ).toList(),

      ),
    );
  }
}
