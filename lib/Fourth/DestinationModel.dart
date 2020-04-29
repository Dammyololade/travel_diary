import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:traveldiary/SessionManager.dart';


class DestinationModel {
  static const String cDestinationName = "destinationName";
  static const String cDepartureDate= "departureDate";
  static const String cArrivalDate = "arrivalDate";
  static const String cStatus = "status";
  static const String cUserId = "userId";


  String destinationName;
  String departureDate;
  String arrivalDate;
  String documentId;
  String status;


  DestinationModel(
      {this.destinationName,
        this.departureDate,
        this.arrivalDate,
        this.documentId,
        this.status
        });


  Map<String, dynamic> toMap() {
    return {
      cDestinationName: destinationName,
      cDepartureDate: departureDate,
      cArrivalDate: arrivalDate,
      cStatus: status,
      cUserId: SessionManager.documentId
    };
  }

  DestinationModel.fromSnapshot(DocumentSnapshot snapshot) {
    documentId = snapshot.documentID;
    destinationName = snapshot.data[cDestinationName];
    departureDate = snapshot.data[cDepartureDate];
    arrivalDate = snapshot.data[cArrivalDate];
    status = snapshot.data[cStatus];

  }
}
