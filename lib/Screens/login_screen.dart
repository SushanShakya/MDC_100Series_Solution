import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mdc_102/Services/facebook_service.dart';
import 'package:mdc_102/app.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _unameController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final _unfocusedColor = Colors.grey[600];

  final _usernameFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          TextField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).accentColor
                        : _unfocusedColor)),
            controller: _unameController,
            focusNode: _usernameFocusNode,
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus
                          ? Theme.of(context).accentColor
                          : _unfocusedColor)),
              controller: _passController,
              obscureText: true,
              focusNode: _passwordFocusNode),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text("Cancel")),
              RaisedButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PracticeApp()));
                  },
                  child: Text("Next")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  endIndent: 10.0,
                  thickness: 2.0,
                )),
                Text("OR"),
                Expanded(
                    child: Divider(
                  indent: 10.0,
                  thickness: 2.0,
                )),
              ],
            ),
          ),
          FlatButton(
              onPressed: () async {
                try {
                  FacebookLoginResult result = await FacebookService().login();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PracticeApp()));
                } catch (e) {
                  print(e.toString());
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text("Error"),
                        content: Text(e.toString()),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                        ],
                      ));
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/facebook.png",
                    height: 30.0,
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Log in with Facebook")
                ],
              )),
        ],
      ),
    ));
  }
}
