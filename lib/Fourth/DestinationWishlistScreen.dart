import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traveldiary/Fourth/AddDestinationScreen.dart';

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
    );
  }
}
