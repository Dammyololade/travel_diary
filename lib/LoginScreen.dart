import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/HomeScreen.dart';
import 'package:traveldiary/SessionManager.dart';
import 'package:traveldiary/UserModel.dart';
import 'package:traveldiary/dashboard/DashboardScreen.dart';

///
/// project: travel_diary
/// @package:
/// @author dammyololade
/// created on 22/04/2020
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);

  final _firestore = Firestore.instance;

  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/landing_image.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 43),
                child: (processing)
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        color: Colors.white.withOpacity(.25),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Login with Google",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            processing = true;
                          });
                          _signInUser();
                        },
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _signInUser() async {
    GoogleSignInAccount account = await _googleSignIn.signIn();
    if (account != null) {
      QuerySnapshot snapshot = await _firestore
          .collection("Users")
          .where("email", isEqualTo: account.email)
          .getDocuments();
      if (snapshot.documents.length >= 1) {
        DocumentSnapshot documentSnapshot = snapshot.documents.first;
        UserModel model = UserModel.fromSnapshot(documentSnapshot);
        saveDetailsLocally(model);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        _saveUserDetails(account);
      }
    }
  }

  void _saveUserDetails(GoogleSignInAccount account) async {
    UserModel model = UserModel(
        email: account.email,
        address: "",
        imageUrl: account.photoUrl,
        userName: account.displayName);
    DocumentReference reference =
        await _firestore.collection("Users").add(model.toMap());
    if (reference != null) {
      DocumentSnapshot snapshot = await reference.get();
      UserModel model = UserModel.fromSnapshot(snapshot);
      saveDetailsLocally(model);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {}
  }

  void saveDetailsLocally(UserModel model) {
    SessionManager.email = model.email;
    SessionManager.address = model.address;
    SessionManager.imageUrl = model.imageUrl;
    SessionManager.userName = model.userName;
    SessionManager.isLoggedIn = true;
    SessionManager.documentId = model.documentId;
  }
}
