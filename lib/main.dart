import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter TabBar',
      home: new Home(),
      theme: new ThemeData(primaryColor: Colors.black),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = new ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text("ListItem $index"),
            ),
          ),
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));
          },
        );
      },
    );

    var gridView = new GridView.builder(
        itemCount: 20,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text('Item $index'),
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
          );
        });

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TabBar"),
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridView,
          ],
        ),
      ),
    );
  }
}