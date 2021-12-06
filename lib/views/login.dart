import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final appBar = new AppBar(
    title: new Text(""),
    backgroundColor: Color.fromARGB(255, 21, 39, 77),
  );

  @override
  Widget build(BuildContext context) {

    final usernameField = TextField(
      obscureText: false,
      style: style,
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
      style: style,
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
      color: Color.fromARGB(255, 193, 22, 28),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Accedi",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final signinButton = Material(
      elevation: 5.0,
      color: Color.fromARGB(255, 57, 97, 144),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pushNamed(context, '/signin'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius. circular(10.0),
            side: BorderSide(color: Colors. white)
        ),
        child: Text("Registrati",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final resetPassword = Text(
      'Hai dimenticato la password?',
      textAlign: TextAlign.center,
      style: style.copyWith(
          color: Colors.white30, fontSize: 15),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 57, 97, 144),
          child: Padding (
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("CALCIOTTO",
                    textAlign: TextAlign.center,
                    style: style.copyWith(color: Colors.white)),
                SizedBox(height: 35.0),
                usernameField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(height: 10.0,),
                resetPassword,
                SizedBox(height: 40.0,),
                loginButton,
                SizedBox(height: 20.0,),
                signinButton,
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: SizedBox(height: 50, child: appBar),
    );
  }
}
