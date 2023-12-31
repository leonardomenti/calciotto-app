import 'package:flutter/material.dart';
import 'package:calciotto/util/utils.dart';
import 'package:calciotto/controllers/registration_controller.dart';

class Signin extends StatefulWidget {

  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin>{

  final _formKey = GlobalKey<FormState>();

  TextStyle bodyStyle = const TextStyle(fontFamily: 'Gujarati', fontSize: 20.0);
  TextStyle titleStyle = const TextStyle(fontFamily: 'Aspire', fontSize: 20.0);

  final appBar = AppBar(
    title: const Text(""),
    backgroundColor: const Color.fromARGB(255, 21, 39, 77),
  );

  @override
  Widget build(BuildContext context) {

    final usernameField = Utils.createTextField('Username', false);
    final firstNameField = Utils.createTextField('Nome', false);
    final lastNameField = Utils.createTextField('Cognome', false);
    final passwordField = Utils.createTextField('Password', true);
    final emailField = Utils.createTextField('Email', false);

    var res;

    final signinButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color.fromARGB(255, 193, 22, 28),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => {
          if (_formKey.currentState!.validate()){
          res = RegistrationController.register_user(
            usernameField.controller!.text,
            firstNameField.controller!.text,
            lastNameField.controller!.text,
            emailField.controller!.text,
            passwordField.controller!.text
            ).then((res) => {
              if (res == 200){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Utente creato con successo!'),
                      backgroundColor: Colors.green,
                    )
                ),
                Navigator.pushNamed(context, '/')
              }
              else{
                if (res == 401){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username o Password già esistenti'),
                        backgroundColor: Colors.red,
                      )
                  ),
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Impossibile creare l\'utente'),
                        backgroundColor: Colors.red,
                      )
                  ),
                }
              }
          })}
        },
        child: Text("Registrati",
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final backToLoginButton = Material(
      elevation: 5.0,
      color: Color.fromARGB(255, 43, 42, 41),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pushNamed(context, '/'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius. circular(10.0),
            side: BorderSide(color: Colors. white)
        ),
        child: Text("Indietro",
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
            color: Color.fromARGB(255, 100, 101, 103),
            child: Padding (
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text("CALCIOTTO",
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(color: Colors.white)),
                    SizedBox(height: 10.0),
                    usernameField,
                    SizedBox(height: 5.0),
                    firstNameField,
                    SizedBox(height: 5.0),
                    lastNameField,
                    SizedBox(height: 5.0),
                    passwordField,
                    SizedBox(height: 5.0,),
                    emailField,
                    SizedBox(height: 20.0,),
                    signinButton,
                    SizedBox(height: 20.0,),
                    backToLoginButton,
                  ],
                ),
              )
            )
        ),
      ),
    );
  }
}
