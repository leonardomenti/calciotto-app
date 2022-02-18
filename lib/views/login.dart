import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextStyle body_style = TextStyle(fontFamily: 'Gujarati', fontSize: 20.0);
  TextStyle title_style = TextStyle(fontFamily: 'Aspire', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    final usernameField = TextField(
      obscureText: false,
      style: body_style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          fillColor: Colors.white,
          filled: true,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: body_style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pushNamed(context, '/testapi'),
        child: Text("ACCEDI",
            textAlign: TextAlign.center,
            style: title_style.copyWith(
                color: Color.fromARGB(255, 100, 101, 103),
                fontWeight: FontWeight.bold)),
      ),
    );

    final signinButton = Material(
      elevation: 5.0,
      color: Color.fromARGB(255, 193, 22, 28),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pushNamed(context, '/signin'),
        child: Text("REGISTRATI",
            textAlign: TextAlign.center,
            style: title_style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final resetPassword = Text(
      'Hai dimenticato la password?',
      textAlign: TextAlign.center,
      style: body_style.copyWith(
          color: Colors.white30, fontSize: 15),
    );

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
                SizedBox(
                  height: 150.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: mHeight * 0.01,),
                Text("CALCIOTTO",
                    textAlign: TextAlign.center,
                    style: title_style.copyWith(color: Colors.white)),
                SizedBox(height: mHeight * 0.05,),
                usernameField,
                SizedBox(height: mHeight * 0.02,),
                passwordField,
                SizedBox(height: mHeight * 0.01,),
                resetPassword,
                SizedBox(height: mHeight * 0.1,),
                loginButton,
                SizedBox(height: mHeight * 0.02,),
                signinButton,
              ],
            ),
          )
        ),
      ),
    );
  }
}
