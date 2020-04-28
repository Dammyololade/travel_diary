import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:traveldiary/Fourth/DestinationModel.dart';
import 'package:traveldiary/ThirdScreen/Final.dart';

    class Destination extends StatefulWidget {
      @override
      _DestinationState createState() => _DestinationState();
    }

    class _DestinationState extends State<Destination> {
       String _dsname;
       String formatdate;
       String formatdate1;

       final _firestore = Firestore.instance;

        DateTime _seldate;
       DateTime _seldate1;

       DateTime _currentDate = new DateTime.now();
       DateTime _currentDate1 = new DateTime.now();

       Future <Null> _selectdate(BuildContext context) async{
          _seldate = await showDatePicker(
             context: context,
             initialDate: _currentDate,
             firstDate: DateTime(2019),
             lastDate: DateTime(2025),
           builder: (context, child){
               return SingleChildScrollView(child: child,);
           }
           );
          if(_seldate != null){
            setState(() {
              _currentDate = _seldate;
            });
          }
       }

       Future <Null> _selectdate1(BuildContext context) async{
         _seldate1 = await showDatePicker(
             context: context,
             initialDate: _currentDate1,
             firstDate: DateTime(2019),
             lastDate: DateTime(2025),
             builder: (context, child){
               return SingleChildScrollView(child: child,);
             }
         );
         if(_seldate1 != null){
           setState(() {
             _currentDate1 = _seldate1;
           });
         }
       }

      @override
      Widget build(BuildContext context) {
         formatdate = new DateFormat.yMMMd().format(_currentDate);
         formatdate1 = new DateFormat.yMMMd().format(_currentDate1);
        return Scaffold(
          body: new Container(
            margin: EdgeInsets.only( top: 20, bottom: 20),
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back, size: 30,),
                      Padding(padding: EdgeInsets.only(left: 5, right: 70, bottom: 10, top: 10)),
                      Text('Add Destination', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5, right: 200),
                    child:
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 200,),
                        Padding(padding: EdgeInsets.only(left: 5, right: 5)),

                        Text('Destination Name', style: TextStyle(fontWeight: FontWeight.bold),),
                        new Container(
                            margin: EdgeInsets.only(
                                left: 25, top: 10),
                            child: new Column(
                              children: [
                                TextField(
                                  onChanged: (String ds){_dsname = ds;},
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 50),
                    child:  new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        Text('When are you planing to Go', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(right: 100, top: 50)),
                        IconButton( onPressed: (){
                          _selectdate(context);
                          }, icon: Icon(Icons.calendar_today,size: 30,), ),
                      ],
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 150),
                    child:
                    Text('$formatdate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 ),),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 30),
                    child:  new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        Text('When is your return date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(right: 120, top: 50)),
                        IconButton(icon: Icon(Icons.calendar_today, size: 30,), onPressed: (){
                          _selectdate1(context);
                        }
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 150),
                    child:
                    Text('$formatdate1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 ),),
                  ),
                  new Container(
                    child:
                    new Column(
                      children: [
                        SizedBox(height: 40,),
                        RaisedButton(onPressed: (){_saveDetails();}, elevation: 5, color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          child:
                          new Text('Add Destination',style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        );
       }
       void _saveDetails() async {


         DestinationModel model = DestinationModel(
           destinationName: _dsname,
           departureDate: formatdate,
           arrivalDate: formatdate1,
         );
         DocumentReference reference =
         await _firestore.collection("Destination").add(model.toMap());
       }
    }
