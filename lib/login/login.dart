import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
     _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]); // Colocar em tela cheia
    super.initState();
  }

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
                      onTap: () {
                        print('Entrar...'); // TODO: Implementar o login por usuário e senha
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