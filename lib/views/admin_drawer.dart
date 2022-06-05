// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:calciotto/services/secure_storeage.dart';

class AdminDrawer extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Gujarati', fontSize: 20.0);
  StorageService storageService = StorageService();

  Divider divider = const Divider(
    color: Colors.white,
    thickness: 1.0,
    height: 1.0,
  );

  @override
  Widget build(BuildContext context) {

    Container createNavEntry(String text, String path) => Container(
        color: Color.fromARGB(255, 140, 26, 32),
        child: ListTile(
            title: Text(
                text,
                style: style.copyWith(color: Colors.white)
            ),
            onTap: () => Navigator.pushNamed(context, path)
        )
    );

    Container createNavLink(String text, String path) => Container(
        color: Color.fromARGB(255, 90, 90, 90),
        child: ListTile(
            title: Text(
                text,
                style: style.copyWith(
                    fontSize: 15.0,
                    color: Colors.white)
            ),
            onTap: () => Navigator.pushNamed(context, path)
        )
    );

    return Drawer(
        child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Container(
                  color: Color.fromARGB(255, 140, 26, 32),
                  child: DrawerHeader(
                    child: Row(children: [
                      Column(children : [
                        FutureBuilder(
                            future: storageService.readSecureData('username'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data as String, style: TextStyle(fontSize: 25));
                              } else {
                                return Text('Loading...');
                              }
                            }
                        )
                      ]),
                      SizedBox(width: 80),
                      Column(children: [
                        Image.asset('assets/images/logo.png', height: 80.0)])
                    ]),
                  )),
              createNavEntry("Nuova Giornata", "/new_match"),
              createNavEntry("Nuova Squadra", "/new_team"),
              createNavEntry("Lista Giornate", "/admin"),
              createNavEntry("Lista Squadre", "/admin"),
              createNavEntry("Lista Utenti", "/admin"),
              createNavEntry("Nuova Comunicazione", "/admin"),
              createNavEntry("Quote", "/admin"),
              createNavEntry("Regolamento", "/admin"),
              divider,
              createNavEntry("User", "/"),
              divider,
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          createNavLink("Regolamento", "/"),
                          createNavLink("Esci", "/"),
                          createNavLink("Elimina Account", "/")
                        ],
                      ))),
            ]
        )
    );
  }
}