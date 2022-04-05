import 'package:calciotto/util/utils.dart';
import 'package:flutter/material.dart';
import 'navdrawer.dart';

class PersonalData extends StatefulWidget {

  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() {
    return PersonalDataState();
  }
}

class PersonalDataState extends State<PersonalData> {

  final _formKey = GlobalKey<FormState>();

  TextStyle title_style = TextStyle(fontFamily: 'Aspire', fontSize: 25.0);
  TextStyle body_style = TextStyle(fontFamily: 'Gujarati', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    Row createRow(String text) => Row(
        children: [
          Expanded(
              child: Text(text, style: body_style.copyWith(color: Colors.white))
          ),
          SizedBox(
            width: mWidth * 0.01,
          ),
          Expanded(
              child: Utils.createTextField("", false)
          )
        ]
    );

    final modifyButton = ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 100, 101, 103)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.white)
                )
            )
        ),
        onPressed: () => {
          if (_formKey.currentState!.validate())
            Navigator.pushNamed(context, '/home')
        },
        child: Text("MODIFICA",
            textAlign: TextAlign.center,
            style: body_style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold)),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 100, 101, 103),
        drawer: NavDrawer(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(mHeight * 0.05),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 100, 101, 103),
              elevation: 0,
              title: Text(
                "Dati Personali",
                style: title_style.copyWith(color: Colors.white)
              )
            )
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                createRow("Nome e Cognome"),
                createRow("Email"),
                createRow("Telefono"),
                createRow("Data di nascita"),
                createRow("Password"),
                Container(height: mHeight * 0.1),
                modifyButton
              ]),
            )
        )
    );
  }
}
