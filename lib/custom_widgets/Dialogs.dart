import 'package:flutter/material.dart';
import 'package:trading/customization/AppColors.dart';

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

class CreateAccountDialog extends StatelessWidget {

  final String title, description;

  CreateAccountDialog({
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {

    final double _width = MediaQuery.of(context).size.width/1.2;
    final double _height = MediaQuery.of(context).size.height/1.2/11;
    final double _heightButton = 50;

    return Container(
      padding: EdgeInsets.only(
        //right: 12,
        //left: 12,
        //bottom: 12,
      ),

      height: MediaQuery.of(context).size.height/1.6,
      
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.green_dark,
                  AppColors.green_light
                ],
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Criar Conta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
            ),
            //color: Colors.grey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 12,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Preencha de acordo com as considerações abaixo:',
                        style: TextStyle(
                          color: Colors.black54
                        ),
                      ),

                      Padding(padding: EdgeInsets.all(5),),

                      Text('- O e-mail informado deve ser válido.',
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                      Text('- A senha deve ter no mínimo 6 dígitos.',
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: _heightButton,
                  width: _width,
                  padding: EdgeInsets.only(
                    top: 4, 
                    left: 16, 
                    right: 16, 
                    bottom: 4
                  ),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0,5)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50)
                  ),
                  
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.green_dark,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      focusColor: AppColors.green_dark,
                      border: InputBorder.none,
                      hintText: 'E-mail'
                    ),
                  ),
                ),

                Container(
                  height: _heightButton,
                  width: _width,
                  margin: EdgeInsets.only(
                    top: 42
                  ),
                  padding: EdgeInsets.only(
                    top: 4, 
                    left: 16, 
                    right: 16, 
                    bottom: 4
                  ),
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0,5)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50)
                  ),
                  
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.green_dark,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      focusColor: AppColors.green_dark,
                      border: InputBorder.none,
                      hintText: 'Senha'
                    ),
                  ),
                ),

                Container(
                  height: _heightButton,
                  width: _width,
                  margin: EdgeInsets.only(
                    top: 42
                  ),
                  padding: EdgeInsets.only(
                    top: 4, 
                    left: 16, 
                    right: 16, 
                    bottom: 4
                  ),
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0,5)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50)
                  ),
                  
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.green_dark,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      focusColor: AppColors.green_dark,
                      border: InputBorder.none,
                      hintText: 'Confirmar senha'
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.all(12),),

                /* SizedBox(
                  height: ,
                ), */
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        textColor: Colors.black26,
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        hoverColor: Colors.red,
                        child: Text('CANCELAR',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),

                      FlatButton(
                        textColor: AppColors.green_light,
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        hoverColor: Colors.red,
                        child: Text('CRIAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}