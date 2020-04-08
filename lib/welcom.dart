import 'package:flutter/material.dart';

class Wlc extends StatefulWidget {
  @override
  _WlcState createState() => _WlcState();
}

class _WlcState extends State<Wlc> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.88,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  child: SizedBox(
                    height: height * 0.05,
                  ),
                ),
                Center(
                  child: Image(image: AssetImage("lib/assets/wikaya-logo.png")),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                    'ما عليك كان تخلي التطبيقة هذه وال Bluetooth محلولين, إذا فما أي خطر عليك والا عائلتك تو نتصلو بيك',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: height * 0.04,
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: width * 0.15,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: width * 0.6,
            height: height * 0.1,
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff8DBF44), Color(0xff8DBF44)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "احمــــــي روحـك و عــائلتـك",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontSize: height * 0.03),
                      ),
                    ),
                    onTap: () {
                      // Pushing a named route

                      Navigator.of(context).pushNamed(
                        '/phone',
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
