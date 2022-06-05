import 'dart:convert';
import 'admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:calciotto/api/api.dart';
import 'package:calciotto/controllers/new_team_controller.dart';


class NewTeam extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewTeam();
  }
}

class _NewTeam extends State<NewTeam> {

  String playerT1_1 = "0",
      playerT1_2 = "0",
      playerT1_3 = "0",
      playerT1_4 = "0",
      playerT1_5 = "0",
      playerT1_6 = "0",
      playerT1_7 = "0",
      playerT1_8 = "0",
      playerT1_9 = "0";
  bool error = false;

  TextStyle titleStyle = const TextStyle(fontFamily: 'Aspire', fontSize: 20.0);

  List<DropdownMenuItem<String>> items = ["---"].map((countryone) {
    return DropdownMenuItem(
      child: Text(countryone), //label of item
      value: "0", //value of item
    );
  }).toList();

  TextStyle style = TextStyle(fontFamily: 'Gujarati', fontWeight: FontWeight.bold, fontSize: 20.0);

  @override
  void initState() {
    error = false;
    loadList();
    super.initState();
  }

  Future<void> loadList() async{
    var list= await Api.listUsers();
    var json= JsonDecoder().convert(list);
    var buttons = json.map<DropdownMenuItem<String>>((user) {
      return DropdownMenuItem(
        child: Text(user["username"] as String, textAlign: TextAlign.center,), //label of item
        value: user["id"].toString(), //value of item
        );
    }).toList();
    setState(() {
      items.addAll(buttons);
    });
  }
  var res;
  final teamNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    teamNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final creationButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async => {
          if (true){
            res = NewTeamController.create_team(
                teamNameController.text,
                playerT1_1,
                playerT1_2,
                playerT1_3,
                playerT1_4,
                playerT1_5,
                playerT1_6,
                playerT1_7,
                playerT1_8,
            ).then((res) => {
              if (res == "OK")
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content: Text('Squadra Creata con successo'),
                  backgroundColor: Colors.green,
                  )
                )
              else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Errore - Controlla gli inserimenti'),
                        backgroundColor: Colors.red,
                      )
                  ),
                }
            }),
          }
        },
        child: Text("Crea",
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(
                color: Color.fromARGB(255, 100, 101, 103),
                fontWeight: FontWeight.bold)),
      ),
    );

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    TextField createTextField(String text) => TextField (
      readOnly: false,
      controller: teamNameController,
      style: TextStyle(fontFamily: 'Gujarati', fontSize: 20.0, height: 2.5),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );


    Container teamContainer() => Container(
      height: mHeight * 0.045,
      width: mWidth * 0.5,
      child: createTextField("Nome"),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 100, 101, 103),
      drawer: AdminDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(mHeight * 0.05),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 100, 101, 103),
            elevation: 0,
            title: Text(
              "Creazione Squadra",
              style: style,
            ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30.0,
                        child: Text(
                            "Nome Squadra",
                            style: titleStyle.copyWith(color: Colors.white))
                    ),
                    Container(height: mHeight * 0.009),
                    teamContainer(),
                    ],
                ),
            ]),
            const Divider(
              height: 40,
              thickness: 0.75,
              indent: 10,
              endIndent: 10,
              color: Colors.white,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        Text("Giocatori", style: titleStyle.copyWith(color: Colors.white)),
                        Container(height: mHeight * 0.009),
                      ],
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("GK "),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_1,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_1 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("DEF"),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_2,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_2 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("DEF"),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_3,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_3 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("DEF"),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_4,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_4 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("MF "),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_5,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_5 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("MF "),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_6,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_6 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("MF "),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_7,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_7 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("ATT"),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_8,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_8 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),
     /*       Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("ATT"),
                  Container( width: mWidth * 0.05),
                  Container( //wrapper for Country list
                    width: mWidth * 0.4,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: playerT1_9,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() {
                            playerT1_9 = newValue!;
                          });
                        }
                    ),
                  ),
                ]
            ),*/
            Container( height: mHeight*0.05,),
          creationButton,
          ]
        )
    );
  }
}