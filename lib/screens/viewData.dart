import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:county_manager/src/variables.dart';
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

class _viewDataState extends State<viewData> {
  var user = FirebaseAuth.instance.currentUser;

  late Stream<QuerySnapshot> _query;

  @override
  Widget build(BuildContext context) {
    _query = FirebaseFirestore.instance
        .collection('guestbook')
        .orderBy('timestamp', descending: true)
        .snapshots();

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
            centerTitle: true,
            title: Text("Vista de datos"),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasData) {
                return datosCard(
                  documents: data.data!.docs,
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            },
          ),
        ));
  }
}

class datosCard extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final nombreP, precioP, descrP, tipoP;

  datosCard({Key? key, required this.documents})
      : nombreP = documents.map((doc) => doc['nameP'] as String),
        precioP = documents.map((doc) => doc['priceP'] as String),
        descrP = documents.map((doc) => doc['descP'] as String),
        tipoP = documents.map((doc) => doc['typeP'] as String),
        super(key: key);

  @override
  State<datosCard> createState() => _datosCardState();
}

class _datosCardState extends State<datosCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var datosI in widget.documents)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: datosI["typeP"].toString() == "Necesario"
                        ? Colors.green
                        : Color.fromARGB(255, 45, 114, 92),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nombre: ${datosI["nameP"].toString()}"),
                          Text("Precio: ${datosI["priceP"].toString()}"),
                        ],
                      ),
                    ),
                    Text("Descripcion del Producto"),
                    Row(
                      children: [
                        Expanded(
                          child: Text("${datosI["descP"].toString()}"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
