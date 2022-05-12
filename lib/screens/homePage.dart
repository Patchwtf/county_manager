import 'package:county_manager/controllers/authentication.dart';
import 'package:county_manager/controllers/controllerAuth.dart';
import 'package:county_manager/src/variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(home());

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: tema(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('County Manager'),
        ),
        body: ListView(
          children: <Widget>[
            Consumer<ApplicationState>(
              builder: (context, appState, _) => Authentication(
                email: appState.email,
                loginState: appState.loginState,
                startLoginFlow: appState.startLoginFlow,
                verifyEmail: appState.verifyEmail,
                signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                cancelRegistration: appState.cancelRegistration,
                registerAccount: appState.registerAccount,
                signOut: appState.signOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
