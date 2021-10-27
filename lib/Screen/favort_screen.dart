import 'package:flutter/material.dart';
import 'package:my_project/Model/Subcategory.dart';
import 'package:my_project/widget/Sub_Category_Item.dart';

class FavoryScreen extends StatelessWidget {
 final  List<Subcategory> favoritcategory;
  FavoryScreen(this.favoritcategory);
  @override
  Widget build(BuildContext context) {
    if (favoritcategory.isEmpty){
      return Center(
        child: Text(" this page is empty "),
      );
    }

    else
     {
       print ("${favoritcategory.length}");
       return ListView.builder(
         itemBuilder: (context, index) {
           return Subcategoryitem(
             //removeitem: removeitem,
             id: favoritcategory[index].id,
             tit: favoritcategory[index].title,
             image: favoritcategory[index].image,
             price: favoritcategory[index].price,
             isnew: favoritcategory[index].isnew,
             origin: favoritcategory[index].origin,
           );
         },
         itemCount: favoritcategory.length,
       );
     }
  }
}
