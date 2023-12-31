import 'package:flutter/material.dart';
import 'package:calciotto/services/secure_storeage.dart';
class NavDrawer extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Gujarati', fontSize: 20.0);
  StorageService storageService = StorageService();

  Divider divider = const Divider(
    color: Colors.white,
    thickness: 1.0,
    height: 1.0,
  );

  @override
  Widget build(BuildContext context) {

    Container createNavEntry(IconData icon, String text, String path) => Container(
      color: Color.fromARGB(255, 90, 90, 90),
      child: ListTile(
          leading: Icon(icon , color: Colors.white),
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
            color: Color.fromARGB(255, 90, 90, 90),
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
          createNavEntry(Icons.home, "Home", "/home"),
          createNavEntry(Icons.account_circle, "Dati Personali", "/personal_data"),
          createNavEntry(Icons.local_post_office, "Comunicazioni", "/news"),
          createNavEntry(Icons.moving, "Statistiche", "/"),
          createNavEntry(Icons.sports_soccer, "Classifica", "/"),
          divider,
          createNavEntry(Icons.account_circle, "Admin", "/"),
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