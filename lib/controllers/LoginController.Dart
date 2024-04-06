import 'package:flutter/material.dart';

void signup(GlobalKey<FormState> key,
BuildContext context,  
{required  email,
 required String password }) {
  if (!key.currentState!.validate()) {
    return;
  }
  print("$email $password");
  Navigator.pushNamed(context, "home");
}

String? validTextFormField(value) {
  if (value == null || value.isEmpty) {
    return "El campo es obligatorio.";
  }
  return null;
}