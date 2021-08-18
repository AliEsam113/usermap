import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

push(BuildContext context,Widget widget){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget));
}
void launchURL(url) async {
  if(await canLaunch(url)){
    await launch(url);
  }
  else{
    throw 'Could not launch $url';
  }
}

