import 'package:flutter/material.dart';
import 'package:trading/customization/AppColors.dart';

double _heightButton = 50;
double _width;
double _height;

class Dialogs {

  createAccount(BuildContext context) {

    _width = MediaQuery.of(context).size.width/1.2;
    _height = MediaQuery.of(context).size.height/1.2/11;

    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmController = new TextEditingController();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 0.0,
          child: Container(
            height: 470,
            width: _width,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: <Widget>[
                
                _header(_width, _height, context, 'Criar Conta'),

                Container(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 12,
                    right: 12
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Os seguintes requisitos devem ser seguidos:',
                              textAlign: TextAlign.justify,
                              style: TextStyle (
                                height: 1.2,
                                color: Colors.black54,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 6, left: 12, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('- Ser um um e-mail válido.',
                                    style: TextStyle (
                                      height: 1.2,
                                      color: AppColors.green_dark,
                                    ),
                                  ),

                                  Text('- A senha deve conter pelo menos 6 dígitos.',
                                    style: TextStyle (
                                      height: 1.2,
                                      color: AppColors.green_dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      _textField(emailController, TextInputType.emailAddress, Icons.email, 'E-mail'),
                      _textField(passwordController, TextInputType.text, Icons.vpn_key, 'Senha'),
                      _textField(confirmController, TextInputType.text, Icons.vpn_key, 'Confirmar senha'),

                      Container(
                        margin: EdgeInsets.only(
                          top: 22
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text('CANCELAR',
                                style: TextStyle(
                                  color: Colors.black38
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            ),

                            FlatButton(
                              child: Text('ENVIAR',
                                style: TextStyle(
                                  color: AppColors.green_light,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } 
    );
  }

  reminderPassword(BuildContext context) {

    _width = MediaQuery.of(context).size.width/1.2;
    _height = MediaQuery.of(context).size.height/1.2/11;

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 0.0,
          child: Container(
            height: 315,
            width: _width,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: <Widget>[
                
                _header(_width, _height, context, 'Redefinir Senha'),

                Container(
                  padding: EdgeInsets.only(
                    top: 32,
                    left: 12,
                    right: 12
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('Será enviado um link para redefinição de senha para o e-mail que deve-se informar abaixo.',
                        textAlign: TextAlign.justify,
                        style: TextStyle (
                          height: 1.2,
                          color: Colors.black54,
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
                        margin: EdgeInsets.only(
                          top: 22
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text('CANCELAR',
                                style: TextStyle(
                                  color: Colors.black38
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            ),

                            FlatButton(
                              child: Text('ENVIAR',
                                style: TextStyle(
                                  color: AppColors.green_light,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } 
    );
  }

  Widget _header(double _width, double _height, BuildContext context, String title) {
  return Container(
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
        Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ],
    ),
  );
}

  Widget _textField(TextEditingController controller, TextInputType keyboardType, IconData icon, String hintText) {
    return Container(
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
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColors.green_dark,
        decoration: InputDecoration(
          icon: Icon(icon),
          focusColor: AppColors.green_dark,
          border: InputBorder.none,
          hintText: hintText
        ),
      ),
    );
  }
}
/*
class CreateAccountDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width/1.2;
    final double _height = MediaQuery.of(context).size.height/1.2/11;
    final double _heightButton = 50;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {

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

class ReminderPasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _header(),
        ],
      ),
    );
  }
}
*/

