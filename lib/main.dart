import 'package:flutter/material.dart';
import 'package:my_project/Screen/Item_Screen.dart';
import 'package:my_project/Screen/filter_screen.dart';
import 'Model/Subcategory.dart';
import 'Screen/SubCategory.dart';
import 'Screen/tab_bar_screen.dart';
import 'app_date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filter={
    "isnew":false ,
    "isuse":false ,
    "issyp":false ,
  };
  List<Subcategory>filtersubcategory=Sub_category_data;
  List<Subcategory>favoritcategory=[];
  void _mangmentfavorit(String id){
    final favoritId=favoritcategory.indexWhere((subcategory)=>
     subcategory.id==id);

   if(favoritId>=0)
     {
       setState(() {
         favoritcategory.removeAt(favoritId);
       });
     }
   else{
     setState(() {
       favoritcategory.add(Sub_category_data.firstWhere((sub) => sub.id==id));
     });
   }


  }
  bool ischiik(String id){
   return favoritcategory.any((sub) => sub.id==id);
  }
  void _selectfilter(Map<String,bool>fil){
setState(() {
  _filter=fil;
  filtersubcategory=Sub_category_data.where((subcategory){
    if(_filter['isnew']==true&&subcategory.isnews!=true){
      return false;
    }
    if(_filter['isuse']==true&&subcategory.isue!=true){
      return false;
    }
    if(_filter['issyp']==true&&subcategory.issyp!=true){
      return false;
    }
    return true ;
  }).toList();
});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'travel',
      initialRoute: '/',
      routes: {

        '/':(ctx)=>TabScreen(favoritcategory) ,
        SubCategory.routsubcategory:(ctx)=>SubCategory(filtersubcategory),
        ItemScreen.Itemrout:(ctx)=>ItemScreen(_mangmentfavorit,ischiik),
     FilterScreen.routscreen:(ctx)=>FilterScreen(_selectfilter,_filter,),
      },
    );
  }
}
