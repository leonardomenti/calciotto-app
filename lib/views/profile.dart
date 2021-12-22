import 'package:flutter/material.dart';
import 'navdrawer.dart';

class Profile extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
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
                width: 160,
                height: 100,
                child: Center(
                  child: Text(
                      text,
                      style: style.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                )
            ),
          )
      );

  @override
  Widget build(BuildContext context) {

    final exitButton = Material(
      elevation: 5.0,
      color: const Color.fromARGB(255, 224, 224, 224),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 70,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius. circular(10.0),
            side: BorderSide(color: Colors. red),
        ),
        child: Text("Esci",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );

    final deleteButton = Material(
      elevation: 5.0,
      color: const Color.fromARGB(255, 193, 22, 28),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 70,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius. circular(10.0),
          side: BorderSide(color: Colors. red),
        ),
        child: Text("Elimina Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );



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
                    Container(width: 30.0),
                    SizedBox(
                        height: 30.0,
                        child: Text(
                            "Leonardo Menti",
                            style: style.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                    ),
                  ]),
              Container(height: 10.0),
              Expanded(child: Card(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  child: Column(
                      children: <Widget> [
                        Container(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              createCard(193, 22, 28, "ACCOUNT"),
                              Container(width: 20),
                              createCard(57, 97, 144, "STATISTICHE"),
                            ]
                        ),
                        Container(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              createCard(193, 22, 28, ""),
                              Container(width: 20),
                              createCard(57, 97, 144, "GIOCATORI"),
                            ]
                        ),
                        Container(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              createCard(57, 97, 144, "PRIVACY"),
                              Container(width: 20),
                              createCard(193, 22, 28, ""),
                            ]
                        ),
                        Container(height: 25),
                        exitButton,
                        Container(height: 10),
                        deleteButton,
                      ]
                  )
              ))
            ])
        )
    );
  }
}
