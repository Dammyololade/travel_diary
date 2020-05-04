import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SessionManager.dart';


class JournalModel {
  static const String cTripTitle = "tripTitle";
  static const String cCountry = "country";
  static const String cImageUrl = "imageUrl";
  static const String cImageUrl1 = "imageUrl1";
  static const String cImageUrl2 = "imageUrl2";
  static const String cMoment = "moment";
  static const String cUserId = "userId";
  static const String cRating = "rating";


  String tripTitle;
  String country;
  String imageUrl;
  String imageUrl1;
  String imageUrl2;
  String moment;
  String date, userId;
  String documentId;
  num rating;

  JournalModel({this.tripTitle,
    this.country,
    this.imageUrl,
    this.imageUrl1,
    this.imageUrl2,
    this.moment,
    this.date,
    this.userId,
    this.rating = 0,
    this.documentId});

  Map<String, dynamic> toMap() {
    return {
      cUserId: SessionManager.documentId,
      cTripTitle: tripTitle,
      cCountry: country,
      cImageUrl: imageUrl,
      cImageUrl1: imageUrl1,
      cImageUrl2: imageUrl2,
      cMoment: moment,
      cRating: rating,
    };
  }

  JournalModel.fromSnapshot(DocumentSnapshot snapshot) {
    documentId = snapshot.documentID;
    tripTitle = snapshot.data[cTripTitle];
    country = snapshot.data[cCountry];
    imageUrl = snapshot.data[cImageUrl];
    imageUrl1 = snapshot.data[cImageUrl1];
    imageUrl2 = snapshot.data[cImageUrl2];
    moment = snapshot.data[cMoment];
    rating = snapshot.data[cRating];
  }
}
