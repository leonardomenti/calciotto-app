import 'package:flutter/material.dart';
import 'navdrawer.dart';

class News extends StatelessWidget{

  TextStyle title_style = TextStyle(fontFamily: 'Aspire', fontSize: 25.0);
  TextStyle body_style = TextStyle(fontFamily: 'Gujarati', fontSize: 20.0);

  Divider divider = const Divider(
    color: Colors.white,
    thickness: 1.0,
    height: 1.0,
  );

  @override
  Widget build(BuildContext context) {

    double mWidth= MediaQuery.of(context).size.width;
    double mHeight= MediaQuery.of(context).size.height;

    Container createNews(String data, String title, String path) => Container(
        color: Colors.transparent,
        child: ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            title: Text(
                data,
                style: body_style.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white)
            ),
            subtitle: Text(
                title,
                style: body_style.copyWith(
                    fontSize: 15.0,
                    color: Colors.white)
            ),
          onTap: () => Navigator.pushNamed(
              context,
              "/news_page",
              arguments: {
                'data' : data,
                'title' : title
              }
          )
        )
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text(
              "Comunicazioni",
              style: title_style.copyWith(color: Colors.white)
          )
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
              Container(height: mHeight * 0.05),
              divider,
              createNews("06/12/21", "Partita annullata", "/"),
              divider,
              createNews("GG/MM/AA", "News 2", "/"),
              divider,
              createNews("GG/MM/AA", "News 3", "/"),
              divider,
              createNews("GG/MM/AA", "News 4", "/"),
              divider,
              createNews("GG/MM/AA", "News 5", "/"),
              divider
            ],
          ),
        ),
      ),
    );
  }
}
