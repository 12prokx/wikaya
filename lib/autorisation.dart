import 'package:flutter/material.dart';

class Auto extends StatelessWidget {
  const Auto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.89,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * .08,
                ),
                Align(
                  alignment: Alignment(0.1, 0),
                  child: Text(
                    'طبيقة وقاية تعمل من خلال',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: height * .05,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Text(
                    'تشغيل كل من',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff8DBF44),
                      fontSize: height * .05,
                    ),
                  ),
                ),
                SizedBox(height: height * .04),
                Row(
                  children: <Widget>[
                    Text('1',
                        style: TextStyle(
                          color: Color(0xff8DBF44),
                          fontSize: height * .05,
                        )),
                    Text('Bluetooth',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: height * .05,
                        )),
                    SizedBox(width: width * 0.07),
                    Image(
                        height: height * 0.2,
                        width: width * .5,
                        image: AssetImage('lib/assets/one.png'))
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: <Widget>[
                    Image(
                        height: height * 0.2,
                        width: width * .5,
                        image: AssetImage('lib/assets/two.png')),
                    SizedBox(width: width * 0.1),
                    Text('الاشعارات',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: height * .05,
                        )),
                    Text('2',
                        style: TextStyle(
                          color: Color(0xff8DBF44),
                          fontSize: height * .05,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text('الرجاء السماح باستعمالها',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: height * .05,
                    )),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.3,
            height: height * 0.07,
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
                      alignment: Alignment.center,
                      child: Text(
                        "المواصلة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height * 0.035, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      // Pushing a named route

                      Navigator.of(context).pushNamed(
                        '/home',
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
