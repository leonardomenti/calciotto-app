import 'package:flutter/material.dart';
import 'navdrawer.dart';

class Home extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Aspire', fontSize: 20.0);
  
  @override
  Widget build(BuildContext context) {

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    SizedBox createHeaderSizedBox(String text) => SizedBox(
        height: 20.0,
        child: Text(
            text,
            style: style.copyWith(color: Colors.white))
    );

    TextField createROTextField(String text) => TextField (
      readOnly: true,
      style: TextStyle(fontFamily: 'Gujarati', fontSize: 18.0, height: 2.5),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    Container createContainer(String text) => Container(
      height: mHeight * 0.04,
      width: mWidth * 0.35,
      child: createROTextField(text),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 100, 101, 103),
      drawer: NavDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(mHeight * 0.05),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 100, 101, 103),
            elevation: 0,
            title: Text(
              "1 Giornata",
              style: style,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () => Navigator.pushNamed(context, '/personal_data'),
              ),
            ],
          )
      ),
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        createHeaderSizedBox("DATA"),
                        Container(height: mHeight * 0.005),
                        createContainer("GG/MM/AA")
                      ]),
                      Column(children: [
                        createHeaderSizedBox("ORARIO"),
                        Container(height: mHeight * 0.005),
                        createContainer("20:00")
                      ])
                ]),
                Container(height: mHeight * 0.04),
                Image.asset(
                  "assets/images/pitch.jpg",
                  fit: BoxFit.contain,
                ),
                Container(height: mHeight * 0.04),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        createContainer("/-/"),
                        Container(height: mHeight * 0.005),
                        createHeaderSizedBox("SCORE")
                      ]),
                      Column(children: [
                        createContainer("Nome"),
                        Container(height: mHeight * 0.005),
                        createHeaderSizedBox("MVP"),
                      ])
                    ]),
              ])
    );
  }
}
