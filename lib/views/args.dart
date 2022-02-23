import 'dart:convert';
import 'package:flutter/material.dart';

class Args extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
            color: Color.fromARGB(255, 100, 101, 103),
            child: Padding (
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(arguments['username'],
                      textAlign: TextAlign.center),
                  Text(arguments['password'],
                      textAlign: TextAlign.center),
                  Text(arguments['email'],
                      textAlign: TextAlign.center),
                ],
              ),
            )
        ),
      ),
    );
  }
}