import 'package:flutter/material.dart';
import 'package:my_project/Model/Subcategory.dart';
import 'package:my_project/Screen/Categrey_Screen.dart';
import 'package:my_project/Screen/favort_screen.dart';
import 'package:my_project/widget/Sub_Category_Item.dart';
import 'package:my_project/widget/appdrawer.dart';

import 'Item_Screen.dart';
class TabScreen extends StatefulWidget {
 final  List<Subcategory>favoritcategory;
  @override
  TabScreen(this.favoritcategory);
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _selectindex(int index){
    setState(() {
      _SelectItemIndex=index;
    });

  }
  int _SelectItemIndex=0;
   List<Map<String,Object>>SelectScreen;
  @override
  initState(){

   SelectScreen=[
      {
        'title':"Aroundyou App",
        "Screen":CategreyScreen(),
        'Icon':Icon(Icons.filter_alt_outlined),
      }
      ,{'Screen':FavoryScreen(widget.favoritcategory),
        'title':"Favort",
        'Icon':Icon(Icons.star_border),
      },
    ];
   super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        actions: [
          SelectScreen[_SelectItemIndex]['Icon'],
        ],
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(SelectScreen[_SelectItemIndex]['title']
          , ),
        ),
      ),
      drawer: AppDrawer(

      ),
      body: SelectScreen[_SelectItemIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.orangeAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0XFFFF8080).withOpacity(0.7),
        currentIndex: _SelectItemIndex,
        onTap: _selectindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),
          label: "Main",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.star),
            label: "Favort",),

        ],
      ),


    );
  }
}

