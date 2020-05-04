import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SessionManager.dart';


class NewTripModel {
  static const String cDocumentId = "documnetId";
  static const String cTripTitle = "tripTitle";
  static const String cCountry= "country";
  static const String cImageUrl = "imageUrl";
  static const String cImageUrl1 = "imageUrl1";
  static const String cImageUrl2 = "imageUrl2";
  static const String cMoment = "moment";


  String tripTitle;
  String country;
  String imageUrl;
  String imageUrl1;
  String imageUrl2;
  String moment;
  String date;
  String documentId;

  NewTripModel(
      {this.tripTitle,
        this.country,
        this.imageUrl,
        this.imageUrl1,
        this.imageUrl2,
        this.moment,
        this.date,
        this.documentId});

  Map<String, dynamic> toMap() {
    return {
      cDocumentId: SessionManager.documentId,
      cTripTitle: tripTitle,
      cCountry: country,
      cImageUrl: imageUrl,
      cImageUrl1: imageUrl1,
      cImageUrl2: imageUrl2,
      cMoment: moment,
          };
  }

  NewTripModel.fromSnapshot(DocumentSnapshot snapshot) {
    documentId = snapshot.documentID;
    tripTitle = snapshot.data[cTripTitle];
    country = snapshot.data[cCountry];
    imageUrl = snapshot.data[cImageUrl];
    imageUrl1 = snapshot.data[cImageUrl1];
    imageUrl2 = snapshot.data[cImageUrl2];
    moment = snapshot.data[cMoment];
      }
}
