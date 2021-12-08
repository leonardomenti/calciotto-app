import 'package:flutter/material.dart';
import 'navdrawer.dart';

class Home extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final appBar = AppBar(
    title: const Text(""),
    backgroundColor: const Color.fromARGB(255, 1, 39, 77),
  );

  @override
  Widget build(BuildContext context) {

    final usernameField = TextField(
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          fillColor: Colors.white,
          filled: true,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 193, 22, 28),
      drawer: NavDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body: Padding(
              padding: const EdgeInsets.all(35.0),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0 ,
                          child: Text(
                            "ORARIO",
                            style: style.copyWith(
                                color: Colors.white))
                          ),
                        Container(width: 60.0),
                        SizedBox(
                          height: 30.0,
                            child: Text(
                                "SCORE",
                                style: style.copyWith(
                                    color: Colors.white))
                        ),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0 , width: 130.0,
                          child: usernameField
                        ),
                        Container(width: 10.0),
                        SizedBox(
                          height: 60.0, width: 130.0,
                          child: usernameField
                        )
                      ]),
                  Container(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Image.asset(
                          "assets/images/logo1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(width: 110.0),
                      SizedBox(
                        height: 40.0,
                        child: Image.asset(
                          "assets/images/logo2.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/images/pitch.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
              ])
          )
    );
  }
}
