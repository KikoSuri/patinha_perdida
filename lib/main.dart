import 'package:flutter/material.dart';
import 'package:patinha_perdida/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBo5F_9Br3I_Uo4ipC4HRSojLrp5vZg0aQ",
    appId: "1:246474481860:android:d3c796ef6b63505518a991",
    messagingSenderId: "825536222543",
    projectId: "patinha-perdida-f6a88",
    storageBucket: "acesso-firebase-b5589.appspot.com",
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: android);

  var Firestore = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patinha Perdida',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
