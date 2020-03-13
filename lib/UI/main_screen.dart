import 'package:flutter/material.dart';
import 'package:flutterwasmaapp/UI/map_screen.dart';
import 'package:flutterwasmaapp/UI/repositories_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';
class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  static final String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _tabPage = <Widget>[MapScreen(), RepositoriesListScreen()];
  final _tab = <Tab>[
    Tab(
      icon: Icon(Icons.map),
      child: Text('clients').tr(),
    ),
    Tab(
      icon: Icon(Icons.list),
      child: Text('List'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabPage.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(MainScreen.id),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: _tabPage,
        ),
      ),
    );
  }
}
