import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JSON ListView Example',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple, // Cambio de color a un tono de púrpura
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0), // Añadir un poco de espacio alrededor de cada elemento
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Añadir bordes redondeados al card
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16), // Añadir espacio interno al ListTile
                title: Text(
                  items[index].name,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // Aumentar el tamaño de la fuente
                  ),
                ),
                subtitle: Text(
                  'ID: ${items[index].id}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16, // Aumentar el tamaño de la fuente
                  ),
                ),
                trailing: Icon(Icons.arrow_forward), // Añadir un ícono al final de cada ListTile
                onTap: () {
                  // Agregar cualquier acción deseada al tocar el ListTile
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
