import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:county_manager/src/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:county_manager/firebase_options.dart';
import 'package:provider/provider.dart';

void main() => runApp(viewData());

class viewData extends StatefulWidget {
  @override
  State<viewData> createState() => _viewDataState();
}

var _guestBookMessages;

class _viewDataState extends State<viewData> {
  var user = FirebaseAuth.instance.currentUser;
  final datos =
      FirebaseFirestore.instance.collection("publicacion").snapshots();

  void obtenerDatos() async {
    await FirebaseFirestore.instance
        .collection("publicacion")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .listen(
      (snapshot) {
        _guestBookMessages = [];
        for (final document in snapshot.docs) {
          print(document.data()['nameP'] as String);
          //?_guestBookMessages.add(
          //?  GuestBookMessage(
          //?      nameProduct: document.data()['nameP'] as String,
          //?      priceProduct: document.data()['priceP'] as String,
          //?      typeProduct: document.data()['typeP'] as String,
          //?      descrProduct: document.data()['descP'] as String),
          //?);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0E1436),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF11163B),
          secondary: Color(0xFFFF0067),
        ),
        textTheme: const TextTheme(
            bodyText2: TextStyle(
          color: Color(0xFFFFFFFF),
        )),
      ),
      title: 'viewData',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Verifica los datos'),
        ),
        body: Center(
          child: StyledButton(
            child: Text(
              "Push Me",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await datos.listen(((event) {
                for (final i in event.docs) {
                  print(i.data()['nameP'] as String);
                }
                //print(event.data()!['nameP'] as String);
              }));

              obtenerDatos();
            },
          ),
        ),
      ),
    );
  }
}
