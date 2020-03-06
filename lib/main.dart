/// Example for how to dynamically change the appearance of an AppBar based on BottomNavigationBar page index.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic AppBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  /// Our dynamic AppBar content
  String _appBarTitle;
  List<Widget> _appBarActions = [];
  Color _appBarColor;

  List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Page 1'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.alarm),
      title: Text('Page 2'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_library),
      title: Text('Page 3'),
    ),
  ];

  /// Actions for page 1
  List<Widget> _pageOneActions = [
    IconButton(
      icon: Icon(Icons.add),
      onPressed: () {},
    ),
  ];

  /// Actions for page 2
  List<Widget> _pageTwoActions = [
    IconButton(
      icon: Icon(Icons.add_a_photo),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.add_alert),
      onPressed: () {},
    ),
  ];

  /// Actions for page 3
  List<Widget> _pageThreeActions = [
    IconButton(
      icon: Icon(Icons.add_box),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.add_circle_outline),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.add_call),
      onPressed: () {},
    ),
  ];

  /// Set AppBar content based on page index
  void _setAppBarContent() {
    switch(_pageIndex) {
      case 0:
        setState(() {
          _appBarTitle = "Page One";
          _appBarActions = _pageOneActions;
          _appBarColor = Colors.blue;
        });
        break;
      case 1:
        setState(() {
          _appBarTitle = "Page Two";
          _appBarActions = _pageTwoActions;
          _appBarColor = Colors.green;
        });
        break;
      case 2:
        setState(() {
          _appBarTitle = "Page Three";
          _appBarActions = _pageThreeActions;
          _appBarColor = Colors.indigo;
        });
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    _setAppBarContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: _appBarActions,
        backgroundColor: _appBarColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _pageIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          _setAppBarContent();
        },
        items: _navBarItems,
      ),
    );
  }
}
