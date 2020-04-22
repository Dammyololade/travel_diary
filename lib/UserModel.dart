import 'package:cloud_firestore/cloud_firestore.dart';

/// description:
/// project: travel_diary
/// @package:
/// @author: dammyololade
/// created on: 22/04/2020
class UserModel {
  static const String cEmail = "email";
  static const String cUserName = "userName";
  static const String cAddress = "address";
  static const String cImageUrl = "imageUrl";

  String email;
  String userName;
  String address;
  String imageUrl;
  String documentId;

  UserModel(
      {this.email,
      this.userName,
      this.address,
      this.imageUrl,
      this.documentId});

  Map<String, dynamic> toMap() {
    return {
      cEmail: email,
      cUserName: userName,
      cAddress: address,
      cImageUrl: imageUrl
    };
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    documentId = snapshot.documentID;
    email = snapshot.data[cEmail];
    userName = snapshot.data[cUserName];
    address = snapshot.data[cAddress];
    imageUrl = snapshot.data[cImageUrl];
  }
}
