import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/app_date.dart';
class ItemScreen extends StatelessWidget {
  static const Itemrout ='/temScreen';
  final  Function  isChick;
  final Function mangment;
  ItemScreen(this.mangment ,this.isChick);
  Widget buildtitel(String tit){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Text(tit,
      style: TextStyle(
        color: Colors.orangeAccent,
        fontSize: 26
      ),),
    );
  }
  Widget buildpropel(Widget pro){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0XFF806000)),
        ),
        height: 200,
        child: pro,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   final  argumentroutitem=ModalRoute.of(context).settings.arguments as String ;
    final selectitem=Sub_category_data.firstWhere((item) => item.id==argumentroutitem);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title:Text(selectitem.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset("images/m8.jpg",
              fit: BoxFit.cover,),
            ),
            buildtitel("detalis"),
            buildpropel(
              ListView.builder(itemCount: selectitem.detalis.length,
                  itemBuilder:(ctx,index)=>Container(
                    height: 75,
                    child: Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,0,0),
                        child: Text(selectitem.detalis[index]),
                      ),
                    ),
                  ),),
            ),
            buildtitel("description"),
          buildpropel(
            ListView.builder(
                itemCount: selectitem.description.length,
                itemBuilder: (ctx,index)=>Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage:AssetImage("images/m8.jpg") ,
                      ),
                      title: Text(selectitem.description[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Divider(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),),
          ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(isChick (argumentroutitem)? Icons.star : Icons.star_border),
        onPressed:()=>mangment(argumentroutitem),
      ),
    );
  }
}
