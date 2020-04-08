import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wikaya/autorisation.dart';
import 'package:intl/intl.dart' as intl;

class Code extends StatefulWidget {
  //
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  int _value;
  DateTime _dateTime;
  int selectedradio;
  bool _checkBoxValue = false;
  String _name;
  String _phone;
  final _formKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: buildBody(height, width, context),
      ),
    );
  }

  Column buildBody(double height, double width, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.6,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                              color: Colors.white, fontSize: width * 0.06),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [Color(0xff8DBF44), Color(0xff8DBF44)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'قم بإدخال رمز التفعيل المرسل لك ',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xff8DBF44),
                            fontSize: height * 0.03,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.85,
                          child: Container(
                            width: width * 0.8,
                            child: Card(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                        title: Text(
                                          'التحقق من الرمز',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xff3f3d56)),
                                        ),
                                        leading: Image.asset(
                                          'lib/assets/code.png',
                                          height: height * 0.05,
                                        )),
                                    TextFormField(
                                      textAlign: TextAlign.end,
                                      style: TextStyle(),
                                      onChanged: (value) => setState(() {
                                        _phone = value;
                                      }),
                                      validator: (value) => value.length != 6
                                          ? "ادخل 6 ارقام"
                                          : null,
                                      cursorColor: Color(0xff8DBF44),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: ' الرمـــــز',
                                        labelStyle: TextStyle(
                                          color: Colors.lightGreen[300],
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                      onSaved: (input) =>
                                          _value = num.tryParse(input),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print('message sent ');
                              },
                              child: Text(
                                'إعادة الارسال',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xff8DBF44),
                                ),
                              ),
                            ),
                            Text(
                              'لم يصلك الرمز ؟  ',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(color: Color(0xff3f3d56)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        buildButton(width, height, context),
      ],
    );
  }

  Container buildButton(double width, double height, BuildContext context) {
    return Container(
      width: width * 0.6,
      height: height * 0.07,
      child: RaisedButton(
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff8DBF44),
                  Color(0xff8DBF44),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: InkWell(
              child: Container(
                width: width * 0.6,
                alignment: Alignment.center,
                child: Text(
                  "التحقق من الرمز",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: height * 0.035, color: Colors.white),
                ),
              ),
              onTap: () {
                print(_checkBoxValue);
                // Pushing a named route
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.of(context).pushNamed(
                    '/auto',
                  );
                } else if (!_formKey.currentState.validate()) {
                  showDialog(
                      context: context,
                      child: CupertinoAlertDialog(
                        title: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  height: height * 0.05,
                                  child: Image.asset('lib/assets/end.png')),
                            )),
                        content: Column(
                          children: <Widget>[
                            Image.asset(
                              'lib/assets/no.png',
                              height: height * 0.1,
                            ),
                            Divider(),
                            Text("لا بد ان يكون رمز التاكيد من 6 ارقام"),
                          ],
                        ),
                      ));
                }
              }),
        ),
      ),
    );
  }
}
