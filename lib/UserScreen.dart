import 'package:flutter/material.dart';
import 'package:usermap/Utils.dart';
import 'package:usermap/model.dart';
import 'package:usermap/service.dart';

import 'UserDetail.dart';


class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int id=0;
  bool loading = true;
  List<User> users = [];

  getUsers() async {
    users = await Service().getUsers();
    loading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getUsers();
  }
  void Increament(){
    id++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 13),
        primary: Colors.lightBlueAccent,
        onPrimary: Colors.white,
        fixedSize: new Size(500, 40));
    return Scaffold(
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Increament();
                    push(context, UserDetail(users: users,Id: id,));
                  },
                  child: const Text('Show Users'),
                ),
              ],
            ),
          ),
        ));
  }
}
