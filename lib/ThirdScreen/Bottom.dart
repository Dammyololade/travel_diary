import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
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
