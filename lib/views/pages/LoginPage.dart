import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/LoginController.Dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String imagen =
      "https://images.pexels.com/photos/13709139/pexels-photo-13709139.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  GlobalKey<FormState> _key = GlobalKey();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // Grafica
    // correo, contraseña, boton de registrar, boton login

    //Logica
    // capturar campos boton y contraseña
    // Para mas tarde validarlos
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo(),
            Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      onChanged: (value) => email = value,
                      validator: validTextFormField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: "Correo", hintText: "Ingrese su correo"),
                    ),
                    TextFormField(
                      onChanged: (value) => password = value,
                      validator: validTextFormField,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Contraseña",
                          hintText: "Ingrese la contraseña"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => signup(
                              _key,
                              context,
                              email: email,
                              password: password,
                            ),
                        child: const Text("Ingresar")),
                    TextButton(
                        onPressed: () {},
                        child: const Text("¿No tienes cuenta? Registrarte")),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Container logo() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagen),
        ),
      ),
    );
  }
}
