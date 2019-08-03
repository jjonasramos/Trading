import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              margin: EdgeInsets.only(
                right: 12,
                left: 12
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF43a047),
                    Color(0xFF8bc34a),
                  ],
                  
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Icon(
                    Icons.ac_unit,
                    size: 80,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}