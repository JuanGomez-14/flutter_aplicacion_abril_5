import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/UserController.dart';
import 'package:flutter_application_3/models/User.dart';

import 'dart:ffi';

class HomePage extends StatelessWidget {
  // Crear una lista
  // Agregar un usuario a la lista

  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    _userController.getUsers();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Usuarios"),
        ),
        body: FutureBuilder(
          future: _userController.getUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  List<User>? users = snapshot.data ?? [];
                  return createList(users);
                } else {
                  return const Text(
                      "Error al consumir la API. Intente de nuevo");
                }
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return const Text(
                    "Error en la carga de datos. Intente de nuevo");
            }
          },
        ));
    // createList(),
  }

  ListView createList(List<User>? users) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users![index].name),
          subtitle: Text(users[index].email),
        );
      },
      itemCount: users?.length,
    );
  }
}
