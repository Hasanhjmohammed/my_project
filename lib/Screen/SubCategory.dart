import 'package:flutter/material.dart';
import 'package:my_project/Model/Subcategory.dart';
import '../widget/Sub_Category_Item.dart';
import '../app_date.dart';

class SubCategory extends StatefulWidget {
 static const routsubcategory='/Sub-Category';
final List<Subcategory>newsubcategory;

  const SubCategory(this.newsubcategory);
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  String title;
  List<Subcategory>viewsubcategory;


   removeitem(String id){
     setState(() {
       viewsubcategory.removeWhere((subcategory) {
         return subcategory.id==id;}
       );
     });

  }
  @override
  void didChangeDependencies() {
    final argumentrout=ModalRoute.of(context).settings.arguments
    as Map<String,String>;
    final sid=argumentrout['id'];
     title=argumentrout["title"];
     viewsubcategory=widget.newsubcategory.where((Sub) {
      return Sub.categorys.contains(sid);
    }).toList();
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
         title,
        ),
      ),
      body :ListView.builder(itemBuilder: (context,index){
        return Subcategoryitem(
         // removeitem: removeitem,
          id: viewsubcategory[index].id,
          tit: viewsubcategory[index].title,
            image: viewsubcategory[index].image,
            price:viewsubcategory[index].price,
            isnew: viewsubcategory[index].isnew,
            origin: viewsubcategory[index].origin,
        );


      },
      itemCount: viewsubcategory.length,)
    );
  }
}
