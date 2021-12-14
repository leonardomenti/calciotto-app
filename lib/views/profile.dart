import 'package:flutter/material.dart';
import 'navdrawer.dart';

class Profile extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final appBar = AppBar(
    title: const Text(""),
    backgroundColor: const Color.fromARGB(255, 1, 39, 77),
  );

  Material createCard(int r, int g, int b, String text) =>
      Material(
          color: Color.fromARGB(255, r, g, b),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(40),
            onTap: (){},
            child : SizedBox(
                width: 150,
                height: 100,
                child: Center(
                  child: Text(
                      text,
                      style: style.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                )
            ),
          )
      );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 57, 97, 144),
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                      child: Image.asset(
                        "assets/images/user_image.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(width: 60.0),
                    SizedBox(
                        height: 30.0,
                        child: Text(
                            "Leonardo Menti",
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                    ),
                  ]),
              Container(height: 10.0),
              Card(
                color: const Color.fromARGB(255, 224, 224, 224),
                child: Column(
                  children: <Widget> [
                    Container(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          createCard(193, 22, 28, "ACCOUNT"),
                          Container(width: 40),
                          createCard(57, 97, 144, "STATISTICHE"),
                        ]
                    ),
                    Container(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          createCard(193, 22, 28, ""),
                          Container(width: 40),
                          createCard(57, 97, 144, "GIOCATORI"),
                        ]
                    ),
                    Container(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          createCard(57, 97, 144, "PRIVACY"),
                          Container(width: 40),
                          createCard(193, 22, 28, ""),
                        ]
                    ),
                    Container(height: 30),
                  ]
                )
              )]
            )
        )
    );
  }
}
