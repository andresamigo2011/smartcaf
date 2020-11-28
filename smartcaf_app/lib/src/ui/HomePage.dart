import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_app/login.dart';
import 'package:my_pet_app/src/ui/listaMascotas.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet app",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(accentColor: Colors.white70),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  final _screens = [
    listaMascotas(title: "Lista mascotas")
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet App", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Mascotas"),
              backgroundColor: Colors.blue),
         /* BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              title: Text(""),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              title: Text("Escaner Qr"),
              backgroundColor: Colors.blue),*/
        ],
      ),
    );
  }
}
