import 'package:flutter/material.dart';

class Dialogs {

  errorLogin(BuildContext context, String title, String description) { // Função para chamar o Dialog
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description)
              ],
            ),
          ),

          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            )
          ],
        );
      } 
    );
  }

  waiting(BuildContext context, String title, String description) { // Função para chamar o Dialog
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description)
              ],
            ),
          ),

          
        );
      } 
    );
  }
}