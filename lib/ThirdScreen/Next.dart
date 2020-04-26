import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('I came, I saw, I got', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
              Text('Burnt, I leant to how', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
              Text('to Code', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
              Text('consectetur adipiscing elit, sed', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
              Text('do eiusmod tempor incididi...', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
            ],

          ),
          new Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: new Card(
              color: Color(0xffE5E5E5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)),),
              child: new Stack(
                children: [
                  SizedBox(width: 100,),
                ],
              ),
            ),
          ),

        ],
      ),


    );
  }
}