import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';


class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {

  final _firestore = Firestore.instance;



  @override
  Widget build(BuildContext context) {
         return Container(
           margin: EdgeInsets.only(left: 25, right: 25),
           child:
           new Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 15,),
               new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('24 July 2019 @09:12AM', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                   Icon(Icons.more_vert, size: 20,),
                 ],
               ),
             ],
           ),

         );
       }
}
