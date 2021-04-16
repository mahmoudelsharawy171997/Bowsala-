import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/responsive/responsivefont.dart';
import 'package:bowsala/screens/terms.dart';
import 'package:bowsala/widgets/appbaractions.dart';
import 'package:flutter/material.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController storeNameController = TextEditingController();
TextEditingController storeCityController = TextEditingController();
TextEditingController storeAddressController = TextEditingController();
TextEditingController mobileNumberController = TextEditingController();
TextEditingController bankNameController = TextEditingController();
TextEditingController ipanNumberController = TextEditingController();
TextEditingController storeManagerController = TextEditingController();
TextEditingController managerEmailController = TextEditingController();

final GlobalKey<FormFieldState<String>> storeNameKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> storeCityKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> storeAddressKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> mobileNumberKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> bankNameKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> ipanNumberKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> storeManagerKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> managerEmailKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

bool weekly = true;
bool monthly = false;
bool terms = false;

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff046169), size: 20.0),
        title: Text(
          AppLocalizations.of(context).translate('signup'),
            style: TextStyle(color: Color(0xff046169), fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
        ),
        actions: [
          Languages(),
          SignOut(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width/2.5,
              //   height: 100.0,
              //   margin: EdgeInsets.only(bottom: 10.0),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/logo2.jpeg'),
              //       fit: BoxFit.fill
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(40,10,40,30),
                decoration: BoxDecoration(
                  color: Color(0xffFFA800),
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  AppLocalizations.of(context).translate('registerStore'),
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'lower',),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  AppLocalizations.of(context).translate('welcomeInBowsala'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff046169), fontSize: 25.0, fontFamily: 'upper',),
                ),
              ),
              field('storeName', TextInputType.text, storeNameController, storeNameKey),
              field('city', TextInputType.text, storeCityController, storeCityKey),
              field('storeAddress', TextInputType.text, storeAddressController, storeAddressKey),
              field('mobileNumber', TextInputType.number, mobileNumberController, mobileNumberKey),
              field('bankName', TextInputType.text, bankNameController, bankNameKey),
              field('ipanNumber', TextInputType.text, ipanNumberController, ipanNumberKey),
              field('storeManager', TextInputType.text, storeManagerController, storeManagerKey),
              field('managerEmail', TextInputType.emailAddress, managerEmailController, managerEmailKey),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  AppLocalizations.of(context).translate('paymentWay'),
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: weekly,
                        activeColor: Color(0xff065492),
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            weekly = value;
                            monthly = !value;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.of(context).translate('weekly'),
                        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: monthly,
                        activeColor: Color(0xff065492),
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            monthly = value;
                            weekly = !value;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.of(context).translate('monthly'),
                        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context).translate('agree')}  ',
                    style: TextStyle(color: Color(0xffffa800), fontSize: responsiveSignUpFont(data), fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return Terms();}));
                    },
                    child: Text(
                      '${AppLocalizations.of(context).translate('terms&Conditions')} ',
                      style: TextStyle(color: Color(0xff046169), fontSize: responsiveSignUpFont(data), fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                    ),
                  ),
                  Checkbox(
                    value: terms,
                    activeColor: Color(0xff065492),
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        terms = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Builder(
                  builder: (BuildContext context){
                    return FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                      AppLocalizations.of(context).translate('signup'),
                        style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                      ),
                      color: Color(0xff046169),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        if(!_formKey.currentState.validate()){
                          return Scaffold.of(context).showSnackBar(snack('someFieldsRequired'));
                        }else if(terms == false){
                          return Scaffold.of(context).showSnackBar(snack('acceptTerms'));
                        }else{
                          return null;
                        }
                      },
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
  field(String label, TextInputType inputType, TextEditingController controller, Key key) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field requred!';
          }
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0)),
          labelText: AppLocalizations.of(context).translate(label),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'lower', fontStyle: FontStyle.italic),
        ),
        keyboardType: inputType,
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