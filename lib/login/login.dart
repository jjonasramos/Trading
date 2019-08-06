import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading/custom_widgets/Dialogs.dart';
import 'package:trading/customization/AppColors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Variables ====================================================
  bool _isHidden = true;

  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  Dialogs dialogs = new Dialogs();

  // Methods ======================================================
  void _toggleVisibility() {
    setState(() {
     _isHidden = !_isHidden;
    });
  }

  bool _validateLoginByEmail() {
    String _email = emailController.text.trim();
    String _senha = senhaController.text.trim();

    if(_email.length > 0 && _senha.length > 0)  // TODO: Implementar a validação de LoginByEmail por usuario e senha
      if(_email.contains('@') && _senha.length > 6)
        return true;

    return false;
  }

  void _createAccount() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CreateAccountDialog(
        title: 'Teste',
        description: 'asdSAD',
      ),
    );
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 32
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/5,
                      margin: EdgeInsets.only(
                        right: 12,
                        left: 12,
                        bottom: 32
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: <Widget>[
                          Image.asset("assets/images/trading_logo.png",
                            width: 130,
                            height: 130,
                          )
                        ],
                      ),
                    ),

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

                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 32
                        ),
                        child: Text('Esqueceu sua senha?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                        ),
                      ),

                      onTap: () { // TODO: Implementar o esqueceu a senha
                        print('Entreiiiii');
                      },
                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      margin: EdgeInsets.only(
                        top: 32
                      ),

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.green_dark,
                            AppColors.green_light,
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

                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Center(
                            child: Text('Entrar'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          onTap: () async {
                             if(_validateLoginByEmail()) {
                              dialogs.waiting(context, 'Entrando', 'Fazendo LoginByEmail...');
                              await Future.delayed(Duration(seconds: 2));
                              Navigator.pop(context);

                              // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); // TODO: Mandar para tela inicial

                            } else {
                              dialogs.errorLogin(context, 'Erro', 'Usuário ou Senha pode estar errado. Tente novamente.');
                            } 
                          },
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width/1.26/9,
                        right: MediaQuery.of(context).size.width/1.26/9,
                        top: 32,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('OU',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        top: 32,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Material(
                                    elevation: 6.0,
                                    shape: CircleBorder(),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.5),
                                      child: Ink.image(
                                        image: AssetImage("assets/images/google_logo.png"),
                                        fit: BoxFit.cover,
                                        width: 50.0,
                                        height: 50.0,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(100),
                                          onTap: () {

                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(16),
                                  ),

                                  Material(
                                    elevation: 6.0,
                                    shape: CircleBorder(),
                                    color: Colors.transparent,
                                    child: Ink.image(
                                      image: AssetImage("assets/images/facebook_logo.png"),
                                      fit: BoxFit.cover,
                                      width: 70.0,
                                      height: 70.0,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(100),
                                        onTap: () {

                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        top: 48
                      ),

                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Não possui uma conta?',
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2),
                            ),
                            Text('Crie uma agora!',
                              style: TextStyle(
                                color: AppColors.green_dark,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),

                        onTap: () {
                          _createAccount();
                        },
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