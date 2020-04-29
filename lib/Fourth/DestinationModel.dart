import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class DestinationModel {
  static const String cDestinationName = "destinationName";
  static const String cDepartureDate= "departureDate";
  static const String cArrivalDate = "arrivalDate";


  String destinationName;
  String departureDate;
  String arrivalDate;
  String documentId;


  DestinationModel(
      {this.destinationName,
        this.departureDate,
        this.arrivalDate,
        this.documentId,
        });


  Map<String, dynamic> toMap() {
    return {
      cDestinationName: destinationName,
      cDepartureDate: departureDate,
      cArrivalDate: arrivalDate,

    };
  }

  DestinationModel.fromSnapshot(DocumentSnapshot snapshot) {
    documentId = snapshot.documentID;
    destinationName = snapshot.data[cDestinationName];
    departureDate = snapshot.data[cDepartureDate];
    arrivalDate = snapshot.data[cArrivalDate];

  }
}
