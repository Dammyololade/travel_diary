import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:traveldiary/AppConfig.dart';
import 'package:traveldiary/Fourth/AddDestinationScreen.dart';
import 'package:traveldiary/Fourth/DestinationModel.dart';
import 'package:traveldiary/SessionManager.dart';

///
/// project: travel_diary
/// @package: Fourth
/// @author dammyololade
/// created on 29/04/2020
class DestinationWishlistScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DestinationWishlistScreenState();
  }
}

class _DestinationWishlistScreenState extends State<DestinationWishlistScreen> {
  var _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Destination Wishlist",
          style: TextStyle(color: Color(0xff2C3A49)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddDestinationScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection(AppConfig.destinationCollection)
            .where("userId", isEqualTo: SessionManager.documentId)
            .snapshots(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<QuerySnapshot> querysnapshot) {
          switch (querysnapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              var documents = querysnapshot.data.documents;
              if (documents.isEmpty) {
                return Center(child: Text("You do not have any data"));
              }
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (cont, index) {
                    DestinationModel model = DestinationModel.fromSnapshot(
                        documents[index]);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(child: Text(
                                  "${model.destinationName}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ))
                              ],),
                              SizedBox(height: 4,),
                              RichText(text: TextSpan(
                                  text: "Planning to go on ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "${formatDate(
                                          model.departureDate)}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ]
                              )),
                              SizedBox(height: 4,),
                              Text("${model.status}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffF9B32F),
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                              SizedBox(height: 3,),
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    );
                  });
          }
        },
      ),
    );
  }

  String formatDate(String dateTime) =>
      dateTime == null ? "" : DateFormat.yMMMd().format(
          DateTime.parse(dateTime));
}
