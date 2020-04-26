import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';
import 'package:traveldiary/SecondScreen/SessionManager1.dart';


class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}


class _NewTripState extends State<NewTrip> {


  File _image;
    File _image1;
    File _image2;
     bool process = false;

  final _firestore = Firestore.instance;

  var _date;
  String _trip = "";
  String _country ="";
  String _moment ="";
  String fileName = "";
  String fileName1 = "";
  String fileName2 = "";





  Future getDate() async {
    setState(() {
       _date = DateTime.now();

    });
  }

  Future getIamge() async {
     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image= image;
    });
  }

  Future _getFileName(BuildContext context){
    fileName = basename(_image.path);
    fileName1 = basename(_image1.path);
    fileName2 = basename(_image2.path);
  }



  Future getIamge1() async {
    var image1 = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image1= image1;
    });
  }

  Future getImage2() async{
    var image2 = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image2 = image2;
    });
   }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: new Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'New Trip Journal',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              new Container(
                margin:
                EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The most interesting caption about your trip',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xffF0F0F0),
                      ),
                      margin: EdgeInsets.only(
                          left: 3, right: 25, top: 10, bottom: 10),
                      child: new Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: "Your Trip Title",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )), onChanged: (String str){ _trip = str;},
                          ),

                        ],
                      ),
                    ),
                    new Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color(0xffF0F0F0),
                        ),
                        margin: EdgeInsets.only(
                            left: 3, right: 25, top: 10, bottom: 10),
                        child: new Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: 'City, Country',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  )), onChanged: (String st){_country = st;},
                            ),
                          ],
                        )),
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: new Card(
                              color: Color(0xffF0F0F0),
                              margin: EdgeInsets.only(
                                  right: 5, left: 5, bottom: 10, top: 10),
                              child: (_image!=null)? Image.file(_image,fit: BoxFit.fill)
                                  :new Stack(
                                children: [
                                  new Padding(padding: EdgeInsets.all(30.0)),
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                      child: IconButton(icon:
                                        Icon(Icons.linked_camera,
                                        size: 25,
                                      ), onPressed: (){getIamge();
                                      },
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Card(
                              color: Color(0xffF0F0F0),
                              margin: EdgeInsets.only(
                                  right: 5, left: 5, bottom: 10, top: 10),
                              child: (_image1 != null)? Image.file(_image1, fit: BoxFit.fill)
                                    :new Stack(
                                children: [
                                  new Padding(padding: EdgeInsets.all(30.0)),
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                      child: IconButton(icon:
                                        Icon(Icons.linked_camera,
                                        size: 25,
                                      ),onPressed: (){getIamge1();}
                                      ),
                                      ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Card(
                              color: Color(0xffF0F0F0),
                              child: (_image2 != null)? Image.file(_image2, fit: BoxFit.fill)
                              :new Stack(
                                children: [
                                  new Padding(padding: EdgeInsets.all(30.0)),
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                      child: IconButton(icon:
                                        Icon(Icons.linked_camera,
                                        size: 25,
                                        ), onPressed: (){ getImage2(); },),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                      ),
                       padding: EdgeInsets.only(bottom: 50),
                      child: new Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                hintText:
                                'Recount the best momments of the trip',
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 3, bottom: 5),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            onChanged: (String s) {_moment = s;},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120, top: 80),
                            child: Container(
                              child: Column(
                                children:[
                                  SizedBox(width: 25,),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText:  (_date != null) ? '$_date'  : 'July 20, 2019',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal), enabled: false,
                                    ),
                                  ),
                   ],
                 ),
                            ),
                          ),
                ],
                      ),

                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
          new  Container(
        padding: EdgeInsets.only(left: 25, right: 10, ),
        child:
        new Row(          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            IconButton(icon: Icon(Icons.calendar_today), onPressed: (){ getDate();}),
            new Container(
              child: new Column(
                children: [
                  SizedBox(width: 15,),
                  IconButton(icon: Icon(Icons.camera_enhance), onPressed: (){})
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only( left: 130),
              child: new Column(
                children: [
                  RaisedButton(onPressed: (){
                    setState(() {
                      _getFileName(context);
                      _saveDetails();
                      process = true;
                    });
                  }, color: Colors.orange, highlightColor: Colors.orange, child:
                  new Text('Save', style: TextStyle(color: Colors.white),), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))), ),
                ],

              ) ,
            ),
          ],
        ),


      ),
        ],
          ),
        ),
      ),

    );
  }

  void _saveDetails() async {


    NewTripModel model = NewTripModel(
        tripTitle: _trip,
        country: _country,
        imageUrl: fileName,
        imageUrl1: fileName1,
        imageUrl2: fileName2,
        moment: _moment,
        );
    DocumentReference reference =
    await _firestore.collection("Journals").add(model.toMap());
    /*if (reference != null) {
      DocumentSnapshot snapshot = await reference.get();
      NewTripModel model = NewTripModel.fromSnapshot(snapshot);
      saveDetailsLocally(model);
          } else {} */
  }

  /*void saveDetailsLocally(NewTripModel model) {
    SessionManager1.tripTitle = model.tripTitle;
    SessionManager1.country = model.country;
    SessionManager1.imageUrl = model.imageUrl;
    SessionManager1.imageUrl1 = model.imageUrl1;
    SessionManager1.imageUrl2 = model.imageUrl2;
    SessionManager1.moment = model.moment;
    SessionManager1.date = model.date;
    SessionManager1.documentId = model.documentId;
  }*/
}


