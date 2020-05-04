import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';
import 'package:firebase_storage/firebase_storage.dart';


class NewTripJournalScreen extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTripJournalScreen> {
  File _image;
  File _image1;
  File _image2;
  bool process = false;

  final _firestore = Firestore.instance;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _date;
  String _trip = "";
  String _country = "";
  String _moment = "";
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
      _image = image;
    });
  }

  Future _getFileName(BuildContext context) {
    fileName = basename(_image.path);
    fileName1 = basename(_image1.path);
    fileName2 = basename(_image2.path);
  }




   Future _uploadimage(BuildContext context) async{
    StorageReference _firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =_firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
       }

  Future _uploadimage1(BuildContext context) async{
    StorageReference _firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName1);
    StorageUploadTask uploadTask =_firebaseStorageRef.putFile(_image1);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  Future _uploadimage2(BuildContext context) async{
    StorageReference _firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName2);
    StorageUploadTask uploadTask =_firebaseStorageRef.putFile(_image2);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image Uploaded')));
    });
  }
  Future getIamge1() async {
    var image1 = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image1 = image1;
    });
  }

  Future getImage2() async {
    var image2 = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image2 = image2;
    });
  }

  void _showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "New Trip Journal",
          style: TextStyle(color: Color(0xff2C3A49)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: new Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 17),
                  Text(
                    'The most interesting caption about your trip',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffF0F0F0),

                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          hintText: "Your Trip Title",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xffC4C4C4),
                            fontWeight: FontWeight.bold,
                          )),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (String str) {
                        _trip = str;
                      },
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xffF0F0F0),
                      ),
                      child: new Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2),
                                hintText: "City, Country",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffC4C4C4),
                                  fontWeight: FontWeight.bold,
                                )),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (String st) {
                              _country = st;
                            },
                          ),
                        ],
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: new Card(
                          color: Color(0xffF0F0F0),
                          margin: EdgeInsets.only(
                              right: 5, left: 5, bottom: 10, top: 10),
                          child: (_image != null)
                              ? Image.file(_image, fit: BoxFit.cover,
                            height: 95,)
                              : new Stack(
                            children: [
                              new Padding(
                                  padding: EdgeInsets.all(30.0)),
                              Container(
                                height: 95,
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.linked_camera,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    getIamge();
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
                          child: (_image1 != null)
                              ? Image.file(_image1, fit: BoxFit.cover,
                            height: 95,)
                              : new Stack(
                            children: [
                              new Padding(
                                  padding: EdgeInsets.all(30.0)),
                              Container(
                                height: 95,
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.linked_camera,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      getIamge1();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Card(
                          color: Color(0xffF0F0F0),
                          child: (_image2 != null)
                              ? Image.file(_image2, fit: BoxFit.cover,
                            height: 95,)
                              : new Stack(
                            children: [
                              new Padding(
                                  padding: EdgeInsets.all(30.0)),
                              Container(
                                height: 95,
                                      margin: EdgeInsets.only(
                                          right: 25,
                                          left: 25,
                                          bottom: 15,
                                          top: 15),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.linked_camera,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    getImage2();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  new Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                    ),
                    padding: EdgeInsets.only(bottom: 50),
                    child: new Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Recount the best momments of the trip',
                              contentPadding:
                              EdgeInsets.only(left: 15, top: 3, bottom: 5),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          onChanged: (String s) {
                            _moment = s;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120, top: 80),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: (_date != null)
                                        ? '$_date'
                                        : 'July 20, 2019',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                    enabled: false,
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
          ),
          Container(height: MediaQuery
              .of(context)
              .size
              .height,),
          Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      child: Icon(Icons.calendar_today),
                      onTap: () {
                        getDate();
                      }),
                  SizedBox(
                    width: 15,
              ),
                  IconButton(
                      icon: Icon(Icons.camera_enhance), onPressed: () {}),
                  Expanded(child: SizedBox()),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _getFileName(context);
                        _uploadimage(context);
                        _uploadimage1(context);
                        _uploadimage2(context);
                        _saveDetails();
                        process = true;
                      });
                    },
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: new Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  void _saveDetails() async {
    if (validateInput()) {
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
    }
  }

  bool validateInput() {
    bool validated = false;
    if (_trip == "") {
      _showMessage("Please enter your Trip Title");
    } else if (_country == "") {
      _showMessage("Please enter your country and city");
    } else if (_moment == "") {
      _showMessage("Please enter your moment");
    } else {
      validated = true;
    }
    return validated;
  }
}
