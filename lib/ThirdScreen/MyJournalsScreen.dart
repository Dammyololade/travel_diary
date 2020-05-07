import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';
import 'package:traveldiary/SessionManager.dart';

class MyJournalsScreen extends StatefulWidget {
  @override
  _MyJournalsScreenState createState() => _MyJournalsScreenState();
}

class _MyJournalsScreenState extends State<MyJournalsScreen> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'My Journals',
          style: TextStyle(color: Color(0xff2C3A49), fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: _firestore
              .collection("Journals")
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
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (cont, index) {
                      JournalModel model =
                          JournalModel.fromSnapshot(documents[index]);
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: new Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${model.tripTitle}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${model.moment}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 106,
                                      width: 106,
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(model.imageUrl),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${model.country}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    });
            }
          }),
    );
  }
}
