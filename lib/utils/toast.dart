import 'package:flutter/material.dart';

getScaffold(String message,BuildContext context,Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}
