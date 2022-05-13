import 'package:county_manager/controllers/authentication.dart';
import 'package:county_manager/controllers/controllerAuth.dart';
import 'package:county_manager/screens/homePage.dart';
import 'package:county_manager/screens/updateData.dart';
import 'package:county_manager/screens/viewData.dart';
import 'package:county_manager/src/variables.dart';
import 'package:county_manager/src/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(lobby());

class lobby extends StatefulWidget {
  @override
  State<lobby> createState() => _lobbyState();
}

class _lobbyState extends State<lobby> {
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
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('County manager'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => home())));
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Cajita(
                        colorin: Color.fromARGB(255, 255, 255, 255),
                        escuincle: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.note_add),
                            Text(
                              "Agregar datos",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        puchale: () {
                          setState(() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => updateData()))));
                        },
                      ),
                    ),
                    Expanded(
                        child: Cajita(
                      puchale: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => viewData()))),
                      colorin: Color.fromARGB(255, 255, 255, 255),
                      escuincle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.view_list),
                          Text(
                            "Visualizar datos",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Cajita(
                      colorin: Colors.white,
                      escuincle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.leaderboard),
                          Text(
                            "Tablas",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Nuevo registro"),
                    Icon(Icons.camera_alt)
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => updateData()));
                },
              ),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Cerrar sesión"),
                    Icon(Icons.logout_rounded)
                  ],
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
