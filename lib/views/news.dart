import 'package:flutter/material.dart';
import 'navdrawer.dart';

class News extends StatelessWidget{

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {

    Container createNewsCard(double dist, int r, int g, int b, String text) =>
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * dist,
              right: 0.0,
              left: 0.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Color.fromARGB(255, r, g, b),
              child: Text(
                  text,
                  style: style.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  )
              ),
            ),
          ),
        );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: <Widget>[
                  Card(
                    child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(255, 224, 224, 224),
                          child: SizedBox(
                              height: 30.0,
                              child: Text(
                                  "Comunicazioni",
                                  style: style.copyWith(
                                      color: const Color.fromARGB(255, 57, 97, 144),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                          ),
                        ),
                    ),

                  // news 1
                  createNewsCard(0.2, 135, 0, 0, "Comunicazione 1 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),
                  // news 2
                  createNewsCard(0.3, 57, 97, 144, "Comunicazione 2 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),
                  // news 3
                  createNewsCard(0.4, 193, 22, 28, "Comunicazione 3 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),
                  // news 4
                  createNewsCard(0.5, 57, 97, 144, "Comunicazione 4 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),
                  // news 5
                  createNewsCard(0.6, 193, 22, 28, "Comunicazione 5 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),
                  // news 6
                  createNewsCard(0.7, 57, 97, 144, "Comunicazione 6 \t.\t.\t.\t.\t.\t.\t"
                      ".\t.\t.\t.\t.\t.\t"),


                ])

    );
  }
}
