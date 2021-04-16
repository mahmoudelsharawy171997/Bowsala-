import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/screens/addaddress.dart';
import 'package:bowsala/widgets/appbaractions.dart';
import 'package:flutter/material.dart';




class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

TextEditingController descriptionController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController wieghtController = TextEditingController();
TextEditingController numberOfPeiceController = TextEditingController();
TextEditingController wieght2Controller = TextEditingController();
TextEditingController lengthController = TextEditingController();
TextEditingController breadthController = TextEditingController();
TextEditingController heightController = TextEditingController();

final GlobalKey<FormFieldState<String>> descriptionKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> amountKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> wieghtKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> numberOfPeiceKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> wieght2Key = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> lengthKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> breadthKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> heightKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

bool domestic = true;
bool forward = true;
bool reseve = false;
bool premium = false;
bool document = true;
bool nonDocument = false;
bool prepaid = false;
bool cache = true;
bool selectFromAddress = true;
bool addAddress = false;
bool deliverySelectFromAddress = true;
bool deliveryAddAddress = false;

String type = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff046169), size: 20.0),
        title: Text(
          AppLocalizations.of(context).translate('addShipment'),
            style: TextStyle(color: Color(0xff046169), fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
        ),
        actions: [
          Languages(),
          SignOut(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff046169), width: 2.0)
        ),
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              item(
                'consignmentType',
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: forward == true ? Color(0xff046169) : Colors.transparent,
                      ),
                      child: InkWell(
                        child: Text(
                          '${AppLocalizations.of(context).translate('forward')}  ',
                          style: TextStyle(color: forward == true ? Colors.white : Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                        ),
                        onTap: () {
                          setState(() {
                            forward = !forward;
                            reseve = !forward;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: reseve == true ? Color(0xff046169) : Colors.transparent,
                      ),
                      child: InkWell(
                        child: Text(
                          '${AppLocalizations.of(context).translate('reseve')}  ',
                          style: TextStyle(color: reseve == true ? Colors.white : Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                        ),
                        onTap: () {
                          setState(() {
                            reseve = !reseve;
                            forward = !reseve;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              item(
                'sourceAddress',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: addAddress == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('addAddress')}  ',
                                style: TextStyle(color: addAddress == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                addAddress = !addAddress;
                                selectFromAddress = !addAddress;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: selectFromAddress == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('selectFromAddress')}  ',
                                style: TextStyle(color: selectFromAddress == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                selectFromAddress = !selectFromAddress;
                                addAddress = !selectFromAddress;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    addAddress == true ? AddAddress() : savedAddress(),
                  ],
                ),
              ),
              item(
                'deliveryAddress',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: deliveryAddAddress == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('addAddress')}  ',
                                style: TextStyle(color: deliveryAddAddress == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                deliveryAddAddress = !deliveryAddAddress;
                                deliverySelectFromAddress = !deliveryAddAddress;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: deliverySelectFromAddress == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('selectFromAddress')}  ',
                                style: TextStyle(color: deliverySelectFromAddress == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                deliverySelectFromAddress = !deliverySelectFromAddress;
                                deliveryAddAddress = !deliverySelectFromAddress;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    deliveryAddAddress == true ? AddAddress() : savedAddress(),
                  ],
                ),
              ),
              item(
                'itemType',
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: document == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('document')}  ',
                                style: TextStyle(color: document == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                document = !document;
                                nonDocument = !document;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: nonDocument == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('nonDocument')}  ',
                                style: TextStyle(color: nonDocument == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                nonDocument = !nonDocument;
                                document = !nonDocument;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    documentChecker(),
                  ],
                ),
              ),
              item(
                'description',
                field('description', TextInputType.text, descriptionController, descriptionKey)
              ),
              item(
                'payment',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: cache == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('cache')}  ',
                                style: TextStyle(color: cache == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                cache = !cache;
                                prepaid = !cache;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: prepaid == true ? Color(0xff046169) : Colors.transparent,
                          ),
                          child: InkWell(
                            child: Text(
                                '${AppLocalizations.of(context).translate('prepaid')}  ',
                                style: TextStyle(color: prepaid == true ? Colors.white : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                              ),
                            onTap: () {
                              setState(() {
                                prepaid = !prepaid;
                                cache = !prepaid;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    cache == true ? field('enterAmount', TextInputType.number, amountController, amountKey) : SizedBox(height: 5.0),
                  ],
                ),
              ),
              item(
                'serviceType',
                Row(
                  children: [
                    Checkbox(
                      value: premium,
                      activeColor: Color(0xff046169),
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          premium = value;
                        });
                      }
                    ),
                    Text(
                      '${AppLocalizations.of(context).translate('premium')}  ',
                      style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Builder(
                  builder: (BuildContext context){
                    return FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                      AppLocalizations.of(context).translate('uploadDetails'),
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
      ),
    );
  }
  documentChecker() {
    if(document == true){
      return field('wieght', TextInputType.number, wieghtController, wieghtKey);
    }else{
      return Column(
        children: [
          field('numberOfPiece', TextInputType.number, numberOfPeiceController, numberOfPeiceKey),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                AppLocalizations.of(context).translate('contentType'),
                  style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                ),
              subtitle: Text(
                type,
                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                ),
              trailing: PopupMenuButton(
                child: Icon(Icons.arrow_downward),
                itemBuilder: (BuildContext context){
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text(
                        'MOBILE (MOB)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MOBILE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LAPTOP (LAP)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LAPTOP',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GIFTPACK (GIP)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GIFTPACK',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BATTERY (BAT)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BATTERY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CARRY BAG (CBG)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CARRY BAG',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHERS2 (OTH)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS2',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MP3 PAYER (MPP)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MP3 PLAYER',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GIFTBOX (BX)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GIFTBOX',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MOUSE (MUS)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MOUSE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'POWER CARD (PCRD)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'POWER CARD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LAPTOP/BATTERY (LAP1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LAPTOP/BATTERY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CAMERA (CAM)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CAMERA',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PENDRIVE (PED)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PENDRIVE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CD/MANUALS (CD)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CD/MANUALS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MOIBLE-APPLE (MOB1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MOBILE-APPLE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SEEDS (SEED)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SEEDS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LAPTOP BAG (OTHL)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LATPOP BAG',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MANUALS (MAN)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MANUALS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'ARTIFICIAL JEWELLERY (LAP)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'ARTIFICIAL JEWELLERY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SD CARD (SDCRD)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SD CARD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'USB CABLE (USCBL)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'USB CABLE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'AUTO PARTS (AUT)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'AUTO PARTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CHARGER (CHRG)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CHARGER',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHERS3 (OTH1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS3',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PERFUMES (PED1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PERFUMES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'HIGH END CAMERA (CAM1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'HIGH END CAMERA',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'EAR PHONE (EAR)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'EAR PHONE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'RAKHI (RAK)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'RAKHI',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'COVER (CVR)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'COVER',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHER5 (USCBL1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS5',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GREETING CARD (GRCR)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GREETING CARD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BACK UP BATTERY (BBAT)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BACK UP BATTERY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BATTERY (PHONE / LAPTOP / POWERBANK) (CHRG1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BATTERY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CDs (CD1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CDs',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHERS4 (OTH2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS4',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'FURNITURE (FUR)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'FURNITURE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'HOUSE HOLD GOODS (HHG)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'HOUSE HOLD GOODS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'POWER CABLES (PCRD1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'POWER CABLES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CARRY CASE (CBG1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CARRY CASE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CHOCOLATES (CHCO)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CHOCOLATES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'TOYS (TOY)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'TOYS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CLOTHING (CLTH)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CLOTHING',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LIQUID CHEMICAL (EG:SANTISER ETC) (OTH3)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LIQUID CHEMICAL',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'FOOD ITEM1 (FOD)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'FOOD ITEM1',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SIM CARD/SD CARD (MOB2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SIM CARD/SD CARD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'COMPUTER PARTS (CP1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'COMPUTER PARTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PAINTING / ARTWORK ROLL (PAI)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PAINTING / ARTWORK ROLL',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CREDIT / DEBIT CARD (CHRG2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CREDIT / DEBIT CARD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHERS6 (USBBL3)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS6',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PERFUME (PER)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PERFUME',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MASALA POWER PACK (MP1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MASALA POWER PACK',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GARMENTS CLOTHES (AP1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GRAMENT CLOTHES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LED LCD TV (LLT1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LED LCD TV',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SPICES (CD3)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SPICES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'UNSTITCHED FABRIC (FAB)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'UNSTITCHED FABRIC',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'OTHERS7 (USBL4)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'OTHERS7',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'DOCUMENTS BOX (DC1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'DOCUMENTS BOX',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'ELECTRONICS ITEMS (EL1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'ELECTRONICS ITEM',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'STATIONARY (ST1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'STATIONARY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MOBILE (WITHOUT BATTERY) (MB1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MOBILE (WITHOUT BATTERY)',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SWEETS (SW1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SWEETS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'RAKH1 (RAK1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'RAKH1',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'VECHILES PARTS (ME1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'VECHILES PARTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MONITOR (MON)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MONITOR',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MEDICINE (M1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MEDICINE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'DRY FRUITES (DF1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'DRY FRUITES',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GLASS ITEMS (GLA)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GLASS ITEMS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PASSPORT (PAS)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PASSPORT',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MUSIC CD (CD4)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MUSIC CD',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'LED LIGHTS (LL1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'LED LIGHTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PHOTO FRAME (PF1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PHOTO FRAME',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BODY COVER (EG: MOIBLE CAR) (BC1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BODY COVER',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BAGS (BAG1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BAGS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'FRUIT BOX (PED2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'FRUIT BOX',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SHOES / SLIPPERS (S1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SHOES / SLIPPERS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BOOKS (BK1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BOOKS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PLASTIC ITEMS (P1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PLASTIC ITEMS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GIFT ITEMS (GI1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GIFT ITEMS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'INTERNATIONAL INBOUND COMMODITY (INT)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'INTERNATIONAL INBOUND COMMODITY',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'BUNCH OF DCOUMENTS (BD1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'BUNCH OF DOCUMENTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'PROMOTIONAL MATERIAL (PAPER) (CVR1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'PROMOTIONAL MATERIAL',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'POWDER (P1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'POWDER',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'SURGICAL PARTS (SP1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'SURGICAL PARTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'ECOMMERCE CONTENT (ECM)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'ECOMMERCE CONTETN',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'MEDICAL EQUIPMENT (MAN1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'MEDICAL EQUIPMENT',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CPU (CPU)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CPU',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'GARMENTS (GC1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'GARMENTS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'HOME APPLIANCE (HOMA)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'HOME APPLIANCE',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'TABLETS (CLTH1)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'TABLETS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'FARMING RELATED ITEMS (S2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'FARMING RELATED ITEMS',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'CORPORATE GIFTS (EG: MOMENTOS / WOODEN PALQUES) (CD2)',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      value: 'CORPORATE GIFTS',
                    ),
                  ];
                },
                onSelected: (value){
                  setState(() {
                    type = value;
                  });
                },
              ),
            ),
          ),
          field('wieght', TextInputType.number, wieght2Controller, wieght2Key),
          field('length', TextInputType.number, lengthController, lengthKey),
          field('breadth', TextInputType.number, breadthController, breadthKey),
          field('height', TextInputType.number, heightController, heightKey),
        ],
      );
    }
  }
  savedAddress() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color(0xff046169), width: 1.0)
            ),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                  'User Name',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                ),
              subtitle: Text(
                '20 Cairo, Helippolis Egypt',
                style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color(0xff046169), width: 1.0)
            ),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                  'User Name',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                ),
              subtitle: Text(
                '20 Cairo, Helippolis Egypt',
                style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color(0xff046169), width: 1.0)
            ),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                  'User Name',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                ),
              subtitle: Text(
                '20 Cairo, Helippolis Egypt',
                style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
  item(String title, Widget body) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: ListTile(
        title: Container(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[600],
          ),
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context).translate(title),
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
          ),
        ),
        subtitle: body,
      ),
    );
  }
  field(String label, TextInputType inputType, TextEditingController controller, Key key) {
    return TextFormField(
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
      maxLength: label == 'description' ? 50 : null,
      keyboardType: inputType,
      controller: controller,
    );
  }
  snack(String content) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      duration: Duration(seconds: 2),
      content: Text(
        AppLocalizations.of(context).translate(content),
          style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal)
      ),
      backgroundColor: Colors.red,
    );
  }
}