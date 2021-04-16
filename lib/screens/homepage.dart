import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/responsive/responsivefont.dart';
import 'package:bowsala/screens/additem.dart';
import 'package:bowsala/screens/details.dart';
import 'package:bowsala/widgets/appbaractions.dart';
import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

DateTime from = DateTime.now();
DateTime to = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff046169), size: 20.0),
        title: Text(
          AppLocalizations.of(context).translate('dashboard'),
            style: TextStyle(color: Color(0xff046169), fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
        ),
        actions: [
          Languages(),
          SignOut(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff046169), width: 2.0),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.store, color: Color(0xff046169), size: 65.0),
                title: Text(
                  'Store Name',
                    style: TextStyle(color: Color(0xff046169), fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  '${AppLocalizations.of(context).translate('storeManager')}: Bassel Allam',
                    style: TextStyle(color: Color(0xff046169), fontSize: 15.0, fontFamily: 'lower', fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff046169), width: 2.0),
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context).translate('dateFrom')} ',
                    style: TextStyle(color: Color(0xff046169), fontSize: 13.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                  ),
                  InkWell(
                    child: Text(
                      from == null ? 'Calendar' :
                      '( ${from.toString().substring(0,10)} )  ',
                      style: TextStyle(color: Color(0xff046169), fontSize: 13.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                    ),
                    onTap: () async {
                      var _from = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        lastDate: DateTime.now(),
                        firstDate: DateTime(2018),
                      );
                      if(_from == null){
                          setState(() {
                          from  = DateTime.now();
                        });
                      }else{
                          setState(() {
                          from = _from;
                        });
                      }
                    },
                  ),
                  Text(
                    '${AppLocalizations.of(context).translate('to')}  ',
                    style: TextStyle(color: Color(0xff046169), fontSize: responsiveHomeDateFont(data), fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                  ),
                  InkWell(
                    child: Text(
                      to == null ? 'Calendar' :
                      '( ${to.toString().substring(0,10)} )',
                      style: TextStyle(color: Color(0xff046169), fontSize: responsiveHomeDateFont(data), fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                    ),
                    onTap: () async {
                      var _to = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        lastDate: DateTime.now(),
                        firstDate: DateTime(2018),
                      );
                      if(_to == null){
                          setState(() {
                          to = DateTime.now();
                        });
                      }else{
                          setState(() {
                          to = _to;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      gridItem('recieved', Icons.done, '20', Colors.blue, data),
                      gridItem('pickedUp', Icons.delivery_dining, '20', Colors.yellow, data),
                      gridItem('reachedAtHup', Icons.local_shipping, '20', Colors.green, data),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      gridItem('outForDelivery', Icons.local_shipping, '20', Colors.green, data),
                      gridItem('notDelivered', Icons.cancel, '20', Colors.red, data),
                      gridItem('delivered', Icons.done, '20', Colors.green, data),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '${AppLocalizations.of(context).translate('addShipment')}',
                      style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                    ),
                    color: Color(0xff046169),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return AddItem();}));
                    }
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff046169), width: 2.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xff046169),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.language, color: Colors.white, size: 15.0),
                            ),
                          ),
                          Text(
                            '  www.bowsala.sa',
                            style: TextStyle(color: Color(0xff046169), fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xff046169),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.email, color: Colors.white, size: 15.0),
                            ),
                          ),
                          Text(
                            '  info@bowsala.sa',
                            style: TextStyle(color: Color(0xff046169), fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xff046169),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.phone, color: Colors.white, size: 15.0),
                            ),
                          ),
                          Text(
                            '  920015808',
                            style: TextStyle(color: Color(0xff046169), fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(2.0),
                    width: 125.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo3.jpeg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  gridItem(String statue, IconData icon, String subtitle, Color color, MediaQueryData data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return Details(statue);}));
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width/3.5,
        height: MediaQuery.of(context).size.height/4.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: Colors.white, size: 45),
            Text(
              AppLocalizations.of(context).translate(statue),
              textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: responsiveHomeDateFont(data), fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
            ),
            Text(
              subtitle,
                style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}