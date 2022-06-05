import 'dart:convert';
import 'admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:calciotto/api/api.dart';
import 'package:calciotto/util/utils.dart';
import 'package:calciotto/controllers/new_match_controller.dart';
//import http package manually

class NewMatch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewMatch();
  }
}

class _NewMatch extends State<NewMatch> {

  String team1="---", team2="---";
  bool error = false;

  TextStyle titleStyle = const TextStyle(fontFamily: 'Aspire', fontSize: 20.0);

  List<DropdownMenuItem<String>> items = ["---"].map((countryone) {
    return DropdownMenuItem(
      child: Text(countryone), //label of item
      value: "---", //value of item
    );
  }).toList();
  TextStyle style = TextStyle(fontFamily: 'Gujarati', fontWeight: FontWeight.bold, fontSize: 20.0);

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  void initState() {
    error = false;
    loadList();
    super.initState();
  }

  Future<void> loadList() async{
    var list= await Api.listTeams();
    var json= JsonDecoder().convert(list)["result"];
    var ids= JsonDecoder().convert(list)["ids"];
    var index=0;
    print(json);
    var buttons = json.map<DropdownMenuItem<String>>((team) {
      return DropdownMenuItem(
        child: Text(team["name"] as String), //label of item
        value: ids[index++].toString(), //value of item
        );
    }).toList();
    setState(() {
      items.addAll(buttons);
    });
  }

  var res;


  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    timeController.dispose();
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
            res = NewMatchController.create_match(
              team1,
              team2,
              selectedDate.toString()
            ).then((res) => {
              if (res == "OK")
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Giornata Creata con successo'),
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

    final time = Utils.createTextField('', false);

    TextField createROTextField(String text) => TextField (
      readOnly: true,
      style: TextStyle(fontFamily: 'Gujarati', fontSize: 20.0, height: 2.5),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    TextField createTextField(String text) => TextField (
      readOnly: false,
      controller: timeController,
      style: TextStyle(fontFamily: 'Gujarati', fontSize: 20.0, height: 2.5),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );


    Container createContainer(String text) => Container(
      height: mHeight * 0.045,
      width: mWidth * 0.35,
      child: createROTextField(text),
    );

    Container timeContainer() => Container(
      height: mHeight * 0.045,
      width: mWidth * 0.35,
      child: createTextField("00:00"),
    );

    SizedBox createHeaderSizedBox(String text) => SizedBox(
        height: 20.0,
        child: Text(
            text,
            style: style.copyWith(color: Colors.white))
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
              "Creazione Giornata",
              style: titleStyle,
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
                Row(children: <Widget>[
                  createHeaderSizedBox("Data"),
                  Container(width: mHeight * 0.005),
                  createContainer("${selectedDate.toLocal()}".split(' ')[0]),
                  Container(width: mHeight * 0.005),
                  ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Modifica data'),
                  ),
                ]),
                ]),
              Row(
                children: [
                  Container( height: mHeight * 0.009,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      createHeaderSizedBox("Orario"),
                      Container(width: mHeight * 0.005),
                      timeContainer(),
                ])
              ]),
            const Divider(
              height: 60,
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
                    SizedBox(
                        height: 20.0,
                        child: Text(
                            "Squadra 1",
                            style: style.copyWith(color: Colors.red))
                    ),
                    Container(height: mHeight * 0.007),
                    Container( //wrapper for Country list
                      width: mWidth * 0.3,
                      child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          value: team1,
                          items: items,
                          onChanged: (String? newValue) {
                            setState(() {
                              team1 = newValue!;
                            });
                          }
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container( width: mWidth*0.15,)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 20.0,
                        child: Text(
                            "Squadra 2",
                            style: style.copyWith(color: Colors.blue))
                    ),
                    Container(height: mHeight * 0.007),
                    Container( //wrapper for Country list
                      width: mWidth * 0.3,
                      child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          value: team2,
                          items: items,
                          onChanged: (String? newValue) {
                            setState(() {
                              team2 = newValue!;
                            });
                          }
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container( height: mHeight * 0.1),
            creationButton,
            ]
        )
    );
  }
}