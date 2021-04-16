import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/widgets/appbaractions.dart';
import 'package:flutter/material.dart';



class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

TextEditingController pinCodeController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController mobileNumberController = TextEditingController();
TextEditingController addressLine1Controller = TextEditingController();
TextEditingController addressLine2Controller = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController countryController = TextEditingController();

final GlobalKey<FormFieldState<String>> pinCodeKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> nameKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> mobileNumberKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> addressLine1Key = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> addressLine2Key = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> cityKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> stateKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> countryKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              field('pincode', TextInputType.text, pinCodeController, pinCodeKey),
              field('name', TextInputType.text, nameController, nameKey),
              field('mobileNumber', TextInputType.number, mobileNumberController, mobileNumberKey),
              field('streetName', TextInputType.text, addressLine1Controller, addressLine1Key),
              field('state', TextInputType.text, stateController, stateKey),
              field('city', TextInputType.text, cityController, cityKey),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5.0),
                child: Builder(
                  builder: (BuildContext context){
                    return FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                      AppLocalizations.of(context).translate('add'),
                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                      ),
                      color: Color(0xff046169),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        if(!_formKey.currentState.validate()){
                          return Scaffold.of(context).showSnackBar(snack('someFieldsRequired'));
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
    );
  }
  field(String label, TextInputType inputType, TextEditingController controller, Key key) {
    return Padding(
      padding: EdgeInsets.all(10.0),
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
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          labelText: AppLocalizations.of(context).translate(label),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
        ),
        keyboardType: inputType,
        controller: controller,
        enabled: label == 'pincode' ? false : true,
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      duration: Duration(seconds: 2),
      content: Text(
        AppLocalizations.of(context).translate(content),
          style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic)
      ),
      backgroundColor: Colors.red,
    );
  }
}