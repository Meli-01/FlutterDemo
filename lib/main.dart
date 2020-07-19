import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera_gallery.dart';
import 'contacts.dart';
import 'gps.dart';
import 'remote_api.dart';


Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor defaultColor = Colors.green;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: defaultColor,
      ),
      home: HomePage(title: 'Flutter', defaultColor: defaultColor),
    );
  }
}

class HomePage extends StatefulWidget {
  final MaterialColor defaultColor;

  HomePage({Key key, this.title, this.defaultColor}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Content',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.gps_fixed),
              title: Text('GPS'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GpsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera and Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CameraGalleryPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ContactsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud_download),
              title: Text('Remote API'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => RemoteAPIPage()));
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.gps_fixed),
                  iconSize: 100,
                  color: widget.defaultColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => GpsPage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  iconSize: 100,
                  color: widget.defaultColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CameraGalleryPage()));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.contacts),
                  iconSize: 100,
                  color: widget.defaultColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ContactsPage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cloud_download),
                  iconSize: 100,
                  color: widget.defaultColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => RemoteAPIPage()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}