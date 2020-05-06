import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:traveldiary/custom/LoadingDialog.dart';
import 'package:traveldiary/ThirdScreen/Top.dart';

class NewTripJournalScreen extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}
File _image;

class _NewTripState extends State<NewTripJournalScreen> {
  File _image1;
  File _image2;
  bool process = false;

  String formatDate(DateTime dateTime) =>
      dateTime == null ? "" : DateFormat.yMMMd().format(dateTime);

  final _firestore = Firestore.instance;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _date, _ndate;

  var _titleController = TextEditingController();
  var _addressController = TextEditingController();
  var _commentController = TextEditingController();

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

  Future<dynamic> _uploadimage(File imageFile) async {
    try {
      StorageReference _firebaseStorageRef =
      FirebaseStorage.instance.ref().child(basename(imageFile.path));
      StorageUploadTask uploadTask = _firebaseStorageRef.putFile(imageFile);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (error) {
      print(error);
    }
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
                      controller: _titleController,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
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
                            controller: _addressController,
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
                              ? Image.file(
                            _image,
                            fit: BoxFit.cover,
                            height: 95,
                          )
                              : new Stack(
                            children: [
                              new Padding(padding: EdgeInsets.all(30.0)),
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
                              ? Image.file(
                            _image1,
                            fit: BoxFit.cover,
                            height: 95,
                          )
                              : new Stack(
                            children: [
                              new Padding(padding: EdgeInsets.all(30.0)),
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
                              ? Image.file(
                            _image2,
                            fit: BoxFit.cover,
                            height: 95,
                          )
                              : new Stack(
                            children: [
                              new Padding(padding: EdgeInsets.all(30.0)),
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
                  SizedBox(
                    height: 10,
                  ),
                  new Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                    ),
                    padding: EdgeInsets.only(bottom: 50),
                    child: new Column(
                      children: [
                        TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                              hintText: 'Recount the best momments of the trip',
                              contentPadding:
                              EdgeInsets.only(left: 15, top: 3, bottom: 5),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          maxLines: 5,
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
                                        ? formatDate(_date)
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
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _saveDetails() async {
    if (validateInput()) {
      _ndate = formatDate(_date);
      JournalModel model = JournalModel(
        tripTitle: _titleController.text,
        country: _addressController.text,
        moment: _commentController.text,
        date: _ndate.toString(),
      );
      LoadingDialog(this.context, "Saving you Journal").show();
      if (_image != null) {
        model.imageUrl = await _uploadimage(_image);
      }
      if (_image1 != null) {
        model.imageUrl1 = await _uploadimage(_image1);
      }
      if (_image2 != null) {
        model.imageUrl2 = await _uploadimage(_image2);
      }
      await _firestore.collection("Journals").add(model.toMap());
      Navigator.of(this.context).pop();
     _scaffoldKey.currentState.showBottomSheet((context) =>
         Container(
           margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
           child: new Column(
           children: [
             new CircleAvatar(backgroundColor: Colors.green,
               child:
               Icon(Icons.check, color: Colors.white, size: 35,),
             ),
             SizedBox(height: 25,),
             Text('Journal Has been Ssaved', style: TextStyle(fontSize: 12,),),
             new Container(
               margin: EdgeInsets.only(left: 25, right: 25),
               child:
                Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 15,),
                     new Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           RaisedButton(onPressed: (){
                             setState(() {
                               _titleController.text = "";
                               _addressController.text = "";
                               _commentController.text = "";
                               _image = null;
                               _image1 = null;
                               _image2 = null;
                               _date = null;
                               Navigator.of(context).pop();
                             });
                           },
                             child:
                             Text('Creat New', style: TextStyle(fontSize: 12),),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(8))),
                           ),
                           RaisedButton(onPressed: (){
                             Navigator.of(context).pushReplacement(
                                 MaterialPageRoute(builder: (context) => Top()));
                           },
                             child:
                             Text('View', style: TextStyle(fontSize: 12, color: Colors.white),),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(8))),
                             color: Colors.orange,
                           ),
                     ],
             ),
           ],
           ),
             ),
       ],
           ),
         ));

      setState(() {
        _titleController.text = "";
        _addressController.text = "";
        _commentController.text = "";
        _image = null;
        _image1 = null;
        _image2 = null;
        _showMessage("Journal has been added successfully");
      });
    }
  }

  bool validateInput() {
    bool validated = false;
    if (_titleController.text.isEmpty) {
      _showMessage("Please enter your Trip Title");
    } else if (_addressController.text.isEmpty) {
      _showMessage("Please enter your country and city");
    } else if (_commentController.text.isEmpty) {
      _showMessage("Please enter your moment");
    } else {
      validated = true;
    }
    return validated;
  }


}
