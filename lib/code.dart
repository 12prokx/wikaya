import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Code extends StatefulWidget {
  //
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  int selectedradio;

  @override
  void initState() {
    super.initState();
    selectedradio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedradio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.9,
            child: Column(
              children: <Widget>[
                Container(
                  width: width,
                  height: height * 0.12,
                  child: DecoratedBox(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'الرجاء ملء المعطيات التالية',
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.08),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [Color(0xff8DBF44), Color(0xffD4D92E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      )),
                ),
                SizedBox(height: height * 0.1),
                Text(
                  'أدخل رقم الهاتف',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Color(0xff8DBF44),
                    fontSize: height * 0.05,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  width: width * 0.65,
                  child: TextFormField(
                    maxLength: 8,
                    style: TextStyle(),
                    cursorColor: Color(0xff8DBF44),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Key == 8
                            ? (null)
                            : Container(
                                width: width * 0.04,
                                height: height * 0.04,
                                child: Image(
                                    image: AssetImage('lib/assets/good.png'))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2)),
                        hintText: '+216',
                        suffixIcon: Icon(Icons.call)),
                  ),
                ),
                SizedBox(height: height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'أوافق على تخزين ومعالجة معطياتي الشخصية حسب ',
                          style: TextStyle(fontSize: height * 0.023),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                // return object of type AlertDialog
                                child: CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'lib/assets/korras.png')),
                                      Text("كراس الشروط"),
                                    ],
                                  ),
                                  content: Column(
                                    children: <Widget>[
                                      Text(
                                        "1/حفظ معطياتك الشخصية في خادم المعطيات الخاص بتطبيقة وقاية",
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                          '2/في حالة تم تأكيد حالة إصابة مستعمل بالكورونا سوف نقوم بتقصي لقاءات المصــــــاب في آخر 21 .يوم مع كــــــــل مستخدمي التطبيقة السلطــــــات المعنية سوف تتصل بالمستخدمين و تعلمهم بالخطوات القادمة لحمايتهم و حماية الأفراد في محيطهم',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle()),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: new Text("OK"))
                                  ],
                                ));
                          },
                          child: Text(
                              '                                              كراس الشروط التالية',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: height * 0.023,
                                color: Colors.blue[400],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Radio(
                        activeColor: Color(0xffD4D92E),
                        value: false,
                        groupValue: selectedradio,
                        onChanged: (value) {
                          setSelectedRadio(value);
                        }),
                  ],
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
                      colors: [Color(0xff8DBF44), Color(0xffD4D92E)],
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
                        "تسجــيـــــل",
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
