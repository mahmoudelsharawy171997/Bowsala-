import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/screens/homepage.dart';
import 'package:bowsala/screens/signup.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormFieldState<String>> userNameKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> passwordKey = GlobalKey<FormFieldState<String>>();

  final _formKey = GlobalKey<FormState>();

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                  height: 75.0
              ),
              Column(
                children: [
                  Container(

                    height: MediaQuery.of(context).size.height/4,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight
                      ),
                    ),
                  ),
                ],
              ),
              field('userName', TextInputType.text, userNameController, userNameKey, Icons.account_circle),
              field('password', TextInputType.text, passwordController, passwordKey, Icons.lock),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(50,10,50,10),
                child: Builder(
                    builder: (BuildContext context){
                      return FlatButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          AppLocalizations.of(context).translate('login'),
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'upper'),
                        ),
                        color: Color(0xff046169),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if(!_formKey.currentState.validate()){
                            return Scaffold.of(context).showSnackBar(snack('someFieldsRequired'));
                          }else{
                            return Navigator.push(context, MaterialPageRoute(builder: (_) {return HomePage();}));
                          }
                        },
                      );
                    }
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(50,10,50,10),
                child: Builder(
                    builder: (BuildContext context){
                      return FlatButton(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            AppLocalizations.of(context).translate('registerStore'),
                            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'upper'),
                          ),
                          color: Color(0xffffa800),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            return Navigator.push(context, MaterialPageRoute(builder: (_) {return SignUp();}));
                          }
                      );
                    }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  field(String label, TextInputType inputType, TextEditingController controller, Key key, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10.0),
      child: TextFormField(

        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field requred!';
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff046169), width: 1.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff046169), width: 1.0)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff046169), width: 1.0)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red, width: 1.0)
            ),
            labelText: AppLocalizations.of(context).translate(label),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'lower', fontStyle: FontStyle.italic),
            prefixIcon: Icon(icon, color: Color(0xff046169), size: 25.0),
            suffixIcon: label == 'password' ? IconButton(
              icon: Icon(Icons.remove_red_eye),
              color: Colors.grey,
              iconSize: 18.0,
              onPressed: () {
                setState(() {
                  secure = !secure;
                });
              },
            ): null
        ),
        keyboardType: inputType,
        obscureText: label == 'password' ? secure : false,
        controller: controller,
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      duration: Duration(seconds: 2),
      content: Text(
          AppLocalizations.of(context).translate(content),
          style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'lower', fontStyle: FontStyle.italic)
      ),
      backgroundColor: Colors.red,
    );
  }
}
