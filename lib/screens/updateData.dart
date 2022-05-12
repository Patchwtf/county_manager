import 'package:county_manager/screens/lobby.dart';
import 'package:county_manager/src/variables.dart';
import 'package:county_manager/src/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(updateData());

class updateData extends StatefulWidget {
  @override
  State<updateData> createState() => _updateDataState();
}

class _updateDataState extends State<updateData> {
  final _nameProduct = TextEditingController();

  final _priceProduct = TextEditingController();

  final _descriptionProduct = TextEditingController();

  String _varNameProduct = "";

  String _varPriceProduct = "";

  String _varTypeProduct = "Seleccione";

  String _varDescriptionProduct = "";

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
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Nombre del Producto"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _nameProduct,
                      decoration: InputDecoration(
                          hintText: 'Ingrese el nombre del producto'),
                      onChanged: (texto) {
                        _varNameProduct = texto;
                      },
                    ),
                  ),
                  Text("Costo del producto"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _nameProduct,
                      decoration: InputDecoration(
                          hintText: 'Ingrese el Costo del producto'),
                      onChanged: (texto) {
                        _varPriceProduct = texto;
                      },
                    ),
                  ),
                  Text("Tipo de producto"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      value: _varTypeProduct,
                      hint: Text('Seleccione prioridad'),
                      items: <String>[
                        'Seleccione',
                        'Necesario',
                        'Inecesario'
                      ].map<DropdownMenuItem<String>>((String _varTypeProduct) {
                        return DropdownMenuItem<String>(
                            value: _varTypeProduct,
                            child: Text(_varTypeProduct));
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != 'Seleccione') {
                          setState(() {
                            _varTypeProduct = newValue!;
                            print(_varTypeProduct);
                          });
                        }
                      },
                    ),
                  ),
                  Text("Descripcion del Producto"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _nameProduct,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: 'Ingrese una descripcion para el producto'),
                      onChanged: (texto) {
                        _varNameProduct = texto;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: StyledButton(
                        bg_color: Colors.white,
                        onPressed: (() => Navigator.pop(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Cancelar"), Icon(Icons.cancel)],
                        ),
                      )),
                      Expanded(
                        child: StyledButton(
                          bg_color: Colors.white,
                          onPressed: (() {
                            setState(() {
                              FirebaseAuth.instance
                                  .userChanges()
                                  .listen((user) {
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => lobby()));
                                }
                              });
                            });
                          }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Enviar"), Icon(Icons.send)],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
