import 'package:app/login/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            backgroundColor: Colors.white,
            navigateAfterSeconds: LoginScreen(),
            loaderColor: Colors.transparent
          ),
          Center(
            child: Container(
              height: size.width * 0.7,
              width: size.width * 0.6,
              child: Stack(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/moldura.png',                        
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                
              ),
            )
          )
        ],
      )
    );
  }
}