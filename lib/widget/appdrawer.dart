import 'package:flutter/material.dart';
import 'package:my_project/Screen/filter_screen.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.orangeAccent,
            child: Text("Ouer App",
            style: TextStyle(fontWeight: FontWeight.bold),),
            alignment: Alignment.center,
          ),
         // Divider(color: Colors.orangeAccent,),
         buildListtitle("MainScreen",Icons.card_travel_rounded,(){
           Navigator.of(context).pushReplacementNamed("/");
         }),
          buildListtitle("FilterScreen",Icons.filter_list,(){
            Navigator.of(context).popAndPushNamed(FilterScreen.routscreen);
          }),
        ],
      ),
    );
  }
  Widget buildListtitle(String title,IconData icon,Function Ontabscreen){
    return Column(
      children: [
        ListTile(
          onTap: Ontabscreen,
          leading: Icon(icon,color: Color(0xffff8080),),
          title: Text(title),
        ),
        Divider(color: Colors.orangeAccent,),

      ],
    );
  }
}
