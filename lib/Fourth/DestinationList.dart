import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


  class DestinationList extends StatefulWidget {
    @override
    _DestinationListState createState() => _DestinationListState();
  }

  class _DestinationListState extends State<DestinationList> {
    bool cbool = false;

    Firestore _firestore = Firestore.instance;

    List<DocumentSnapshot> _detail = [];

    _getDetails() async{
      Query q = _firestore.collection("Destination");
      QuerySnapshot querySnapshot= await q.getDocuments();
       _detail = querySnapshot.documents;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:
        new Container(
          alignment: Alignment.center,
          child:
          new Column(
            children: [
              SizedBox(height: 60,),
              Text('Destination Wishlist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 new Container(
                   child: Expanded(
                     child: ListView.builder(
                         itemCount: _detail.length,
                         itemBuilder:(BuildContext context, int index) =>
                         new Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [

                             new Container(
                               margin: EdgeInsets.only(left: 25, right: 10, top: 10, bottom: 10),
                               child:
                               new Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(padding: EdgeInsets.only(left: 10, right: 10)),

                                   Text(_detail[index].data["destinationName"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                   new Container(
                                     margin: EdgeInsets.only( right: 5, top: 3, bottom: 3),
                                     child:
                                     new Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Text(_detail[index].data["destinationName"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),),
                                         Text(_detail[index].data["departureDate"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                       ],
                                     ),
                                   ),
                                   new Container(
                                     margin: EdgeInsets.only( right: 5, top: 3, bottom: 3),
                                     child:
                                     new Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(_detail[index].data["arrivalDate"], style: TextStyle(fontWeight: FontWeight.bold,
                                             color: Colors.orange,
                                             fontSize: 10),),
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                             Checkbox(value: cbool, onChanged: (bool cb){
                               setState(() {
                                 cbool = cb;
                               });
                             }),
                             Divider(color: Colors.grey, thickness: 10,),
                           ],
                         ),
                         ),
                   ),
                 ),
            ],
          ),
        ),
      );
      
    }
  }



