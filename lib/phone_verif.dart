import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wikaya/autorisation.dart';
import 'package:intl/intl.dart' as intl;

class Phone extends StatefulWidget {
  //
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
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
          height: height * 0.9,
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
                          'رقم الهاتف',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xff8DBF44),
                            fontSize: height * 0.03,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.85,
                          height: height * 0.13,
                          child: buildPhoneField(),
                        ),
                        Text(
                          'الاسم واللقب',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xff8DBF44),
                            fontSize: height * 0.03,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.85,
                          height: height * 0.13,
                          child: buildNameField(),
                        ),
                        Text(
                          'تاريخ الولادة',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xff8DBF44),
                            fontSize: height * 0.03,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.85,
                          height: height * 0.13,
                          child: InkWell(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2020),
                                      firstDate: DateTime(2019),
                                      lastDate: DateTime.now())
                                  .then((date) {
                                setState(() {
                                  print(date);
                                  _dateTime = date;
                                });
                              });
                            },
                            child: IgnorePointer(
                              child: Container(
                                  width: width * 0.85,
                                  height: height * 0.13,
                                  child: buildDateField()),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'أوافق على تخزين ومعالجة معطياتي الشخصية حسب ',
                                  style: TextStyle(fontSize: height * 0.02),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        // return object of type AlertDialog
                                        child: CupertinoAlertDialog(
                                          title: Align(
                                            alignment: Alignment.topLeft,
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Icon(Icons.clear)),
                                          ),
                                          content: Column(
                                            children: <Widget>[
                                              Image(
                                                  image: AssetImage(
                                                      'lib/assets/korras.png')),
                                              Text("كراس الشروط"),
                                              Text(
                                                "1/حفظ معطياتك الشخصية في خادم المعطيات الخاص بتطبيقة وقاية",
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              Text(
                                                  '2/في حالة تم تأكيد حالة إصابة مستعمل بالكورونا سوف نقوم بتقصي لقاءات المصــــــاب في آخر 21 .يوم مع كــــــــل مستخدمي التطبيقة السلطــــــات المعنية سوف تتصل بالمستخدمين و تعلمهم بالخطوات القادمة لحمايتهم و حماية الأفراد في محيطهم',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle()),
                                            ],
                                          ),
                                        ));
                                  },
                                  child: Text(
                                      '                                              كراس الشروط التالية',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: height * 0.02,
                                        color: Colors.blue[400],
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            Checkbox(
                                value: _checkBoxValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    _checkBoxValue = value;
                                  });
                                })
                          ],
                        ),
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

  TextFormField buildDateField() {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(),
      cursorColor: Color(0xff8DBF44),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          hintText: _dateTime != null
              ? intl.DateFormat.yMd().format(_dateTime)
              : "تاريخ الولادة",
          suffixIcon: Icon(Icons.date_range)),
      onSaved: (input) => _value = num.tryParse(input),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      textAlign: TextAlign.end,
      textDirection: TextDirection.rtl,
      onChanged: (value) => setState(() {
        _name = value;
      }),
      validator: (value) => value.length < 1 ? "" : null,
      style: TextStyle(),
      cursorColor: Color(0xff8DBF44),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          hintText: "الاسم واللقب",
          suffixIcon: Icon(Icons.person)),
      onSaved: (input) => _value = num.tryParse(input),
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      textAlign: TextAlign.end,
      maxLength: 8,
      style: TextStyle(),
      onChanged: (value) => setState(() {
        _phone = value;
      }),
      validator: (value) => value.length < 8 ? "ادخل 8 ارقام" : null,
      cursorColor: Color(0xff8DBF44),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          hintText: '+216',
          suffixIcon: Icon(Icons.call)),
      onSaved: (input) => _value = num.tryParse(input),
    );
  }

  Container buildButton(double width, double height, BuildContext context) {
    return Container(
      width: width * 0.3,
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
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "تسجــيـــــل",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: height * 0.035, color: Colors.white),
                ),
              ),
              onTap: () {
                print(_checkBoxValue);
                // Pushing a named route
                if (_formKey.currentState.validate() && _checkBoxValue) {
                  _formKey.currentState.save();
                  Navigator.of(context).pushNamed(
                    '/code',
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
                            Text("الرجاء التثبت من المعطيات"),
                          ],
                        ),
                      ));
                } else if (!_checkBoxValue) {
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
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Text("الرجاء الموافقة على شروط الاستخدام"),
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
