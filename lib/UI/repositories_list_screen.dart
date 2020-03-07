import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterwasmaapp/Model/repository_model.dart';
import 'package:http/http.dart' as http;

class RepositoriesListScreen extends StatefulWidget {
  static final String id = 'RepositoriesListScreen';

  RepositoriesListScreen({Key key}) : super(key: key);

  @override
  _RepositoriesListScreenState createState() => _RepositoriesListScreenState();
}

class _RepositoriesListScreenState extends State<RepositoriesListScreen> {

  var _key = GlobalKey();
  List<ExampleRepositoryModel> _repositoryList = List();
  static int _pageNum = 1;
  bool _isPageLoading = false;
  StreamController _listController;

  static Future<List<ExampleRepositoryModel>>
      _getRepositoriesListResponsePerPage(int page) async {
    List<ExampleRepositoryModel> data;
    try {
      var response = await http.get(
          "https://api.github.com/users/JeffreyWay/repos?page=$page&per_page=15");
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body) as List;
        data = list.map((e) => ExampleRepositoryModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  void initState() {
    _listController = StreamController<List<ExampleRepositoryModel>>();
    _getRepositoriesListResponsePerPage(_pageNum).then((value) {
      _listController.add(value);
    });
    super.initState();
  }

  void _setPagination({int index, int length}) {
    if ((length - 3) == index) {
      print((length - 3).toString());
      _isPageLoading = true;
      _pageNum++;
      _getRepositoriesListResponsePerPage(_pageNum).then((value) {
        if(value.isNotEmpty){
          _listController.add(value);
        }else{
          _pageNum--;
        }
      });
      print(_pageNum.toString()+' page');
      print(length.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: Container(
          child: StreamBuilder(
            stream: _listController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                snapshot.data.forEach((element) {
                  if(element!=null){
                    _repositoryList.add(element);
                    _isPageLoading= false ;
                  }else{
                   _isPageLoading= true ;
                  }
                });
              }
              if (_repositoryList.isNotEmpty) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: _repositoryList.length,
                          itemBuilder: (c, index) {
                            _setPagination(
                                index: index, length: _repositoryList.length);
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Full Name ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(_repositoryList
                                                .elementAt(index)
                                                .fullName),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              ' Name ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(_repositoryList
                                                .elementAt(index)
                                                .name),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              ' Node Id ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                                child: Text(_repositoryList
                                                    .elementAt(index)
                                                    .nodeId)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Html Url ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                                child: Text(_repositoryList
                                                    .elementAt(index)
                                                    .htmlUrl)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    _isPageLoading == true
                        ? LinearProgressIndicator()
                        : SizedBox()
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

}
