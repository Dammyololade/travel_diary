import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: new Card(
        color: Color(0xffE5E5E5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)),),
        child: new Stack(
          children: [
            SizedBox(width: 300,),
          ],
        ),
      ),
    );
  }
 }
