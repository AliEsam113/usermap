import 'package:flutter/material.dart';
import 'package:usermap/MapScreen.dart';
import 'model.dart';
import 'package:usermap/Utils.dart';

class UserDetail extends StatefulWidget {
  int Id;
  List<User> users = [];
  UserDetail({this.users, this.Id});

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User of id ${widget.Id}"),
      ),
      body: ListView(
        children: [
          if (widget.Id < 10)
            TextButton(
              onPressed: () {
                setState(() {
                  widget.Id++;
                });
              },
              child: Text("Show Next user"),
            ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Center(
                child: Column(
                  children: [
                    Text(
                        "User's name is :${widget.users[widget.Id - 1].name}\n"),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Text(
                          "Users's email is :${widget.users[widget.Id - 1].email}\n"),
                      onTap: () {
                        launchURL(
                            "mailto:${widget.users[widget.Id - 1].email}");
                      },
                      highlightColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          launchURL("tel:${widget.users[widget.Id - 1].phone}");
                        },
                        child: Text(
                            "User's phone is :${widget.users[widget.Id - 1].phone}\n")),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Text(
                          "User's website is :${widget.users[widget.Id - 1].website}\n"),
                      onTap: () {
                        launchURL(
                            "https://${widget.users[widget.Id - 1].website}");
                      },
                      focusColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        push(context, MapSample(widget.users[widget.Id - 1].address.geo));
                      },
                      child: Text("map view"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.Id > 1)
            TextButton(
              onPressed: () {
                setState(() {
                  widget.Id--;
                });
              },
              child: Text("Show Previous post"),
            ),
        ],
      ),
    );
  }
}
