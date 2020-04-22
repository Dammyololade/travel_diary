import 'package:flutter/material.dart';

///
/// project: travel_diary
/// @package: dashboard
/// @author dammyololade
/// created on 14/04/2020
class MyTripListWidget extends StatelessWidget {
  List<TripModel> items = [];

  @override
  Widget build(BuildContext context) {
    populateItems();
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My Trips",
                style: TextStyle(
                    color: Color(0xff2C3A49),
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "My last month journals",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: Color(0xffED882B), fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var trip = items[index];
                return Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            trip.imagePath,
                            width: 87,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  trip.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    trip.address,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${trip.rating}",
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
              }),
        )
      ],
    );
  }

  void populateItems() {
    items = List<TripModel>.generate(
        10,
        (index) => TripModel(
            name: "Wow amagin timeout at day$index",
            address: "We went to address city $index",
            imagePath: "images/stadium.png",
            rating: 4));
  }
}

class TripModel {
  String name, address, imagePath;
  double rating;

  TripModel(
      {@required this.name,
      @required this.address,
      @required this.imagePath,
      @required this.rating});
}
