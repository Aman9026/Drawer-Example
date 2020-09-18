import 'package:drawer/testpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => new TestPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer Demo"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Aman Gupta"),
              accountEmail: new Text("amangupta884036@protonmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: new Text("AG"),
              ),
            ),
            new ListTile(
                title: new Text("p1"),
                trailing: new Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/a");

                  ///For passing the page name as well
                  /// Navigator.of(context).push(new MaterialPageRoute(
                  ///     builder: (context) => new TestPage("Page name")));
                  /// also make sure to add a constructor on the Testpage to take page name
                }),
            new ListTile(
              title: new Text("p1"),
              trailing: new Icon(Icons.arrow_downward),
            ),
            new Divider(),
            new ListTile(
              title: new Text("p1"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("HomePage"),
        ),
      ),
    );
  }
}
