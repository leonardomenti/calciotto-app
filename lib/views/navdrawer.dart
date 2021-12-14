import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'assets/images/logo.png',
              height: 60.0,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,
                color: Color.fromARGB(255, 62, 65, 102)
                ),
            title: Text(
                'HOME',
                style: style.copyWith(
                  color: const Color.fromARGB(255, 62, 65, 102)
                )
            ),
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          const Divider(
            color: Color.fromARGB(255, 62, 65, 102),
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle,
                color: Color.fromARGB(255, 62, 65, 102)
            ),
            title: Text(
                'PROFILO',
                style: style.copyWith(
                    color: const Color.fromARGB(255, 62, 65, 102)
                )
            ),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          const Divider(
            color: Color.fromARGB(255, 62, 65, 102),
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.local_post_office,
                color: Color.fromARGB(255, 62, 65, 102)
            ),
            title: Text(
                'COMUNICAZIONI',
                style: style.copyWith(
                    color: const Color.fromARGB(255, 62, 65, 102)
                )
            ),
            onTap: () => {},
          ),
          const Divider(
            color: Color.fromARGB(255, 62, 65, 102),
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.moving,
                color: Color.fromARGB(255, 62, 65, 102)
            ),
            title: Text(
                'STATISTICHE',
                style: style.copyWith(
                    color: const Color.fromARGB(255, 62, 65, 102)
                )
            ),
            onTap: () => {},
          ),
          const Divider(
            color: Color.fromARGB(255, 62, 65, 102),
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer,
                color: Color.fromARGB(255, 62, 65, 102)
            ),
            title: Text(
                'CLASSIFICA',
                style: style.copyWith(
                    color: const Color.fromARGB(255, 62, 65, 102)
                )
            ),
            onTap: () => {},
          ),
          const Divider(
            color: Color.fromARGB(255, 62, 65, 102),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}