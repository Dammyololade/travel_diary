import 'package:flutter/material.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child:
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Text('Lagos State', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
