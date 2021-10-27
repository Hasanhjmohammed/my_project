import 'package:flutter/material.dart';
import 'package:my_project/Screen/Item_Screen.dart';
import '../Model/Subcategory.dart';

class Subcategoryitem extends StatefulWidget {

  final String id;
  final String tit;
  final String price;
  final String image;
  final Case isnew;
  final Country origin;
  //final Function removeitem;

  Subcategoryitem({
    @required this.id,
    @required this.tit,
    @required this.image,
    @required this.price,
    @required this.isnew,
    @required this.origin,
  //  this.removeitem
});

  @override
  _SubcategoryitemState createState() => _SubcategoryitemState();
}

class _SubcategoryitemState extends State<Subcategoryitem> {
   String get getisnewtext{
     switch(widget.isnew){
       case Case.New :
         return " New";
         break ;
       case Case.use:
         return " User";
         break ;
       case Case.avg :
         return " hef user";
         break ;

     };
   }

  String get getcounttext{
    switch(widget.origin){
      case Country.syp :
        return " Syrain";
        break ;
      case Country.trk:
        return " Trkya";
        break ;
      case Country.gmy :
        return " gearman";
        break ;
      case Country.usd :
        return " Amrika";
        break ;

    };
  }

  @override
//  void Remove(){
//  widget.removeitem(widget.id) ;
//  }

  void window(BuildContext ctx){

  }

  void Selectitem(BuildContext context){
    Navigator.of(context).pushNamed(ItemScreen.Itemrout,
        arguments:
          widget.id
    ).then((item) {
    if(item!=null){
      //widget.removeitem(item);
       }
        } );
  }

  Widget build(BuildContext context) {

    return InkWell(
     highlightColor: Colors.orangeAccent.withOpacity(0.3),
//      onLongPress: (){
//
//        showDialog(context: context, builder:(_)=>buildAlertDialog(context));
//      },
      onTap: ()=>Selectitem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                    child: Image.asset(widget.image,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                     stops: [
                        0.6,
                        1
                      ],
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.tit,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7,right: 7,top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    children: [
                      Icon(Icons.money,
                        color: Colors.orangeAccent,),
                      Text("${widget.price}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.new_releases,
                        color: Colors.orangeAccent,),
                      Text(getisnewtext),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_balance_sharp,
                        color: Colors.orangeAccent,),
                      Text(getcounttext),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(

        title: Text("Do you want delet this product really"),
        actions: [
          TextButton(onPressed: (){
           // Remove();
            Navigator.of(context).pop();
          }, child: Text("Remove",
          style: TextStyle(
          color: Colors.orangeAccent
      ))),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
           }, child: Text("Cancel",
          style: TextStyle(
            color: Colors.orangeAccent
          ),))
        ],
      );
  }
}
