//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'tab_location.dart';
import 'tab_track.dart';
import 'tab_settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    Geolocation.loggingEnabled = true;
  }

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              label: 'Current',
              icon: new Icon(Icons.location_on),
            ),
            new BottomNavigationBarItem(
              label: 'Track',
              icon: new Icon(Icons.location_searching),
            ),
            new BottomNavigationBarItem(
              label: 'Services',
              icon: new Icon(Icons.location_off),
            ),
            new BottomNavigationBarItem(
              label: 'Settings',
              icon: new Icon(Icons.settings_input_antenna),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return new CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return new TabLocation();
                case 1:
                  return new TabTrack();
                case 3:
                  return new TabSettings();
                default:
                  return new Container(
                    color: Colors.white,
                    child: new Center(
                      child: new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: Text(
                          "Enable location services",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: enableLocationServices,
                      ),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }

  enableLocationServices() async {
    Geolocation.enableLocationServices().then((result) {
      // Request location
    }).catchError((e) {
      // Location Services Enablind Cancelled
    });
  }
}
