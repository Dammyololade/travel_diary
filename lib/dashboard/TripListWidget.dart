import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';

///
/// project: travel_diary
/// @package: dashboard
/// @author dammyololade
/// created on 14/04/2020
class TripListWidget extends StatelessWidget {
  var _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection("Journals").snapshots(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              List<DocumentSnapshot> dataList = snapshot.data.documents;
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                JournalModel model = JournalModel.fromSnapshot(dataList[index]);
                return _itemWidget(model);
              }, childCount: dataList.length));
          }
        });
  }

  Widget _itemWidget(JournalModel model) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: <Widget>[
              Image.network(
                model.imageUrl,
                width: 87,
                height: 76,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.tripTitle,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "${model.country}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "${model.rating}",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange.withOpacity(.2),
                          size: 14,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        )
      ],
    );
  }
}
