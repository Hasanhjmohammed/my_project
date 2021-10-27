import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screen/SubCategory.dart';
class CategoryItem extends StatelessWidget {
  @override
  final String title;
  final String image;
  final String id;

void  SelectSubCategory(BuildContext ct){
  Navigator.of(ct).pushNamed(
    SubCategory.routsubcategory,
    arguments: {
      'id':id,
      'title':title,
    }
  );
}
  const CategoryItem({Key key, this.title, this.image, this.id}) : super(key: key);
  Widget build(BuildContext context) {
    return
       InkWell(
         onLongPress: (){
           showDialog(context: context, builder: (_)=>buildAlertDialog(context));
         },
         splashColor: Colors.yellow,
         borderRadius: BorderRadius.circular(20),
         onTap: ()=>SelectSubCategory(context),
         child: Stack(
           //mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(20),
             child: Image.asset(image,
             height: 250,
             fit: BoxFit.cover,
             ),
           ),
            // Spacer(),
             Container(
               alignment: Alignment.center,
                child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 25
                ), ),

               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.black.withOpacity(0.5),

               ),
              ),

          ],

    ),
       );
  }

  Widget buildAlertDialog(BuildContext context) {
    return AlertDialog(
           title: Text("you cannat remove main category"),
           actions: [
             TextButton(onPressed: (){
               Navigator.of(context).pop();

             }, child: Text("Cancel"))
           ],
         );
  }
}
