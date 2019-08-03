import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading/Dialogs.dart';

import 'loginStartScreen.dart';

class LoginByEmail extends StatefulWidget {
  @override
  _LoginByEmailState createState() => _LoginByEmailState();
}

class _LoginByEmailState extends State<LoginByEmail> {

  // Variables ====================================================
  bool _isHidden = true;

  // Dialog =======================================================
  Dialogs dialogs = new Dialogs();

  // Controllers ==================================================
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  // Methods ======================================================
  void _toggleVisibility() {
    setState(() {
     _isHidden = !_isHidden;
    });
  }

  bool _validateLoginByEmail(String email, String senha) {

    if(email.trim().length > 0 && senha.trim().length > 0) { // TODO: Implementar a validação de LoginByEmail por usuario e senha
      return true;
    }

    return false;
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]); // Colocar em tela cheia
    super.initState();
  }

  // Interface ====================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
          child: Column( // Column porque os objetos estão organizados em coluna
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width, // ocupar o tamanho da tela em largura
                height: MediaQuery.of(context).size.height/2.5,
                margin: EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),

                decoration: BoxDecoration( // estilizar o container
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF43a047),
                      Color(0xFF8bc34a),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    //Spacer(),

                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.monetization_on,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),

                    //Spacer(),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                          top: 32
                        ),
                        child: Text('Trading',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Fredoka One',
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 62,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                        top: 4, 
                        left: 16, 
                        right: 16, 
                        bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusColor: Colors.green,
                          border: InputBorder.none,
                          icon: Icon(Icons.email),
                          hintText: 'E-mail'
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 50,
                      margin: EdgeInsets.only(
                        top: 32
                      ),
                      padding: EdgeInsets.only(
                        top: 4, 
                        left: 16, 
                        right: 16, 
                        bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.vpn_key,),
                          hintText: 'Senha',
                          suffixIcon: IconButton(
                            onPressed: _toggleVisibility,
                            icon: Icon(Icons.visibility_off),
                            splashColor: Colors.white,
                          ),
                        ),
                        
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          //right: 32
                        ),
                        child: GestureDetector(
                          onTap: () {
                             print("Mandar para tela de recuperar senha"); // TODO:: Implementar a recuperação de senha
                          },
                          child: Text("Esqueceu sua senha?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                            ),
                          ),
                        )
                      ),
                    ),

                    Spacer(),
                    
                    GestureDetector(
                      onTap: () async {
                        if(_validateLoginByEmail(emailController.text, senhaController.text)) {
                          dialogs.waiting(context, 'Entrando', 'Fazendo LoginByEmail...');
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);

                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

                        } else {
                          dialogs.errorLogin(context, 'Erro', 'Usuário ou Senha pode estar errado. Tente novamente.');
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/1.2,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF43a047),
                              Color(0xFF8bc34a),
                            ],
                          ),

                          borderRadius: BorderRadius.all(
                            Radius.circular(50)
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),

                        child: Center(
                          child: Text('Entrar'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}