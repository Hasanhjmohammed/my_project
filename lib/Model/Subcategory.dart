import 'package:flutter/material.dart';
enum Case{
 New,
  use,
  avg,
}
enum Country{
  syp,
  trk,
  gmy,
  usd,
}
class Subcategory{

  final String id;
  final List <String >categorys;
  final String title;
  final String image;
  final Case isnew;
  final List<String>detalis;
  final List<String>description;
  final String price;
  final Country origin;
  final bool isnews;
  final bool isue;
  final bool issyp;

  const Subcategory({
    @required this.id,
   @required this.categorys,
   @required this.title,
    @required  this.image,
  @required this.isnew,
  @required this.detalis,
  @required this.description,
  @required this.price,
  @required this.origin,
  @required this.isnews,
  @required this.isue,
  @required this.issyp
    });


}