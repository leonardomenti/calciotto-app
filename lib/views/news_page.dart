import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget{

  TextStyle title_style = TextStyle(fontFamily: 'Aspire', fontSize: 20.0);
  TextStyle body_style = TextStyle(fontFamily: 'Gujarati', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Center(
                child: Text(
                    arguments['data'],
                    style: title_style.copyWith(color: Colors.white)
                )
              )
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red,
                  Colors.black,
                ],
              )
          ),
          child: Column(
            children: [
              Container(height: mHeight * 0.03),
              Text(
                arguments['title'],
                textAlign: TextAlign.center,
                style: title_style.copyWith(color: Colors.white)
              ),
              Container(height: mHeight * 0.05),
              Text(
                  "Descrizione della news",
                  textAlign: TextAlign.center,
                  style: body_style.copyWith(color: Colors.white)
              )
            ]
          )
        )
      )
    );
  }
}
