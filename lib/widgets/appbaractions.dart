import 'package:flutter/material.dart';




class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {},
    );
  }
}






class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {

String lang = 'EN';
  
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Icon(Icons.language),
      itemBuilder: (BuildContext context){
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Text(
              'EN',
              style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: 'lower', fontStyle: FontStyle.italic),
            ),
            value: 'EN',
          ),
          PopupMenuItem(
            child: Text(
              'AR',
              style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: 'lower', fontStyle: FontStyle.italic),
            ),
            value: 'AR',
          ),
        ];
      },
      onSelected: (value){
        setState(() {
          lang = value;
        });
      },
    );
  }
}