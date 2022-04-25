import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Testapi extends StatefulWidget{
  const Testapi({Key? key}) : super(key: key);

  @override
  State<Testapi> createState() => _Testapi();
}

class _Testapi extends State<Testapi> {

  String host_address = '15.161.240.204';

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Future<String> getToken() async{
    final response =  await http.post(
      Uri.parse('http://' + host_address + ':80/api/v1/security/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': 'tiziano',
        'password': 'tiziano',
        'provider': 'db',
      }),
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTextStyle(style: style,
      child: FutureBuilder<String>(
        future: getToken(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
