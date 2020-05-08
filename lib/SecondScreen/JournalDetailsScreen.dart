import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:traveldiary/comments/CommentModel.dart';

///
/// project: travel_diary
/// @package: SecondScreen
/// @author dammyololade
/// created on 07/05/2020
class JournalDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JournalDetailsScreenState();
  }
}

class _JournalDetailsScreenState extends State<JournalDetailsScreen> {
  JournalModel model;
  var _comment = TextEditingController();
  double rate;
  var _date, _ndate;

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  bool showLoading = false;

  String formatDate(DateTime dateTime) =>
      dateTime == null ? "" : DateFormat.yMMMd().format(dateTime);

  Future _getDate() async {
    setState(() {
      _date = DateTime.now();
    });
  }

  final _firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    model = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 360,
            //snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Stack(
                children: [
                  Image.network(
                    model.imageUrl,
                    height: 360,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black38,
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                "${model.country}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          Text(
                            "${model.date ?? "N/A"}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "${model.tripTitle}",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2C3A49)),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "${model.moment}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff2C3A49)),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  FlatButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12)),
                              ),
                              child:
                              Container(
                                height: 250,
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Color(0xffF0F0F0),
                                      ),
                                      child: TextField(
                                        controller: _comment,
                                        decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 2),
                                            hintText: "Drop your Comment......",
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
                                        maxLines: 5,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: RatingBar(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) =>
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffF9B32F),
                                            ),
                                        itemSize: 26,
                                        onRatingUpdate: (rating) {
                                          rate = rating;
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        RaisedButton(
                                          onPressed: () {}, color: Theme
                                            .of(context)
                                            .accentColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text('Cancel',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12, color: Colors.white,
                                            ),),
                                        ),
                                        RaisedButton(onPressed: () {
                                          _getDate();
                                          _saveDetails();
                                        }, color: Theme
                                            .of(context)
                                            .accentColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text('Submit',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12, color: Colors.white,
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    },
                    child: Text(
                      "Add comment",
                      style: TextStyle(
                          fontSize: 13, color: Theme
                          .of(context)
                          .accentColor),
                    ),
                    color: Color.fromARGB(
                        Color.getAlphaFromOpacity(0.19), 237, 136, 43),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Journal Ratings",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _saveDetails() async {
    if (validateInput()) {
      setState(() {
        showLoading = true;
      });
    _ndate = formatDate(_date);
      final collRef = Firestore.instance.collection('Journals');
      DocumentReference docReference = collRef.document();
    CommentModel model = CommentModel(
      comment: _comment.text,
      ratings: rate.toString(),
      date: _ndate.toString(),
      journalId: docReference.documentID,
    );
    await _firestore.collection("Comments").add(model.toMap());
    Navigator.of(context).pop();
  }
 }

  bool validateInput() {
    bool validated = false;
    if (_comment.text.isEmpty) {
      _showMessage("Please enter your comment");
    } else {
      validated = true;
    }
    return validated;
  }

}
