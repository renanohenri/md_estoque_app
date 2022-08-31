

import 'package:app/global/ui/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AgendarScreen extends StatefulWidget{


  @override
  _AgendarScreen createState() => _AgendarScreen();

}

class _AgendarScreen extends State<AgendarScreen>{
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFD35D35),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(context, 10),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.15, 
                size.height * 0.0, 
                size.width * 0.15, 
                size.width * 0.05
              ),
              child: Container(
                child: Text(
                  'Agendar',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFD35D35),
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}