import 'package:flutter/material.dart';
import 'package:traveldiary/Constants.dart';
import 'package:traveldiary/HomeScreen.dart';
import 'package:traveldiary/LoginScreen.dart';
import 'package:traveldiary/SessionManager.dart';
import 'package:traveldiary/dashboard/DashboardScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: const FirebaseOptions(
      googleAppID: '1:160829198106:android:8e27bc5c9117772c9926a3',
      gcmSenderID: '160829198106',
      apiKey: Constants.FCM_APi,
      projectID: 'generalapps-dda1e',
    ),
  );
  final Firestore firestore = Firestore(app: app);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          accentColor: Color(0xffED882B)
      ),
      home: SessionManager.isLoggedIn ? HomeScreen() : LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
