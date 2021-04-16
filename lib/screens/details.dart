import 'package:bowsala/models/appLocatizations.dart';
import 'package:bowsala/widgets/appbaractions.dart';
import 'package:flutter/material.dart';





class Details extends StatefulWidget {

final String type;

Details(this.type);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff046169), size: 20.0),
        title: Text(
          AppLocalizations.of(context).translate(widget.type),
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
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: field(),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xff046169), width: 1.0)
                    ),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Shipment Number',
                          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'upper', fontStyle: FontStyle.italic),
                        ),
                      subtitle: Text(
                        'Added at 20 Dec 2020\nExcpected Delivery at 25 Dec 2020',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                      ),
                      trailing: Text(
                        AppLocalizations.of(context).translate(widget.type),
                        style: TextStyle(color: Color(0xffffa800), fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              bottom: true,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
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
            ),
          ],
        ),
      ),
    );
  }
  field() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff046169), width: 1.0)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff046169), width: 1.0)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff046169), width: 1.0)),
          labelText: AppLocalizations.of(context).translate('consignmentNumber'),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'lower', fontStyle: FontStyle.italic),
          prefixIcon: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffffa800)
            ),
            child: Icon(Icons.search, color: Colors.white, size: 25.0)
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        controller: searchController,
      ),
    );
  }
}