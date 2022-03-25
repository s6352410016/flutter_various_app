import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_various_app/view/car_buy_ui.dart';
import 'package:flutter_various_app/view/temperature_ui.dart';
import 'package:flutter_various_app/view/traingle_area_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Various App',
              ),
              accountEmail: Text(
                'SAU',
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              currentAccountPicture: Image.asset('assets/images/banner.png'),
              otherAccountsPictures: [
                Image.network(
                    'https://icons.iconarchive.com/icons/chanut/role-playing/512/Spell-Book-icon.png'),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              title: Text(
                'Temperature Convertor',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.temperatureHigh,
                color: Colors.red,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TraingleAreaUI(),
                  ),
                );
              },
              title: Text(
                'Traingle Area',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.exclamationTriangle,
                color: Colors.blue,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              title: Text(
                'Car Buy',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.car,
                color: Colors.purple,
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text(
                'ออกจากแอปพลิเคชั่น',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.doorClosed,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.temperatureHigh,
              ),
              label: Text('Go To Temperature Convertor'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TraingleAreaUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.exclamationTriangle,
              ),
              label: Text('Go To Traingle Area'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.car,
              ),
              label: Text('Go To Car Buy'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80,
                  50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
