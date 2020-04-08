import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String text = 'wikayaaa';
  String subject = 'wikayaa balalalllaabbblablzlbzlblzb';
  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));

    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                  child: Image.asset(
                'lib/assets/logo.png',
                scale: 0.9,
              )),
            ),
            SizedBox(
              height: height * 0.14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        // return object of type AlertDialog
                        child: CupertinoAlertDialog(
                          title: Column(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        height: height * 0.05,
                                        child:
                                            Image.asset('lib/assets/end.png')),
                                  )),
                              Image(image: AssetImage('lib/assets/share.png')),
                              Text("عن التطبيقة"),
                            ],
                          ),
                          content: Column(
                            children: <Widget>[
                              Text(
                                "تهدف تطبيقة وقاية إلى معاضدة جهود الوزارة في تحديد المشتبه بإنتقال عدوى مرض الكورونا إليهم",
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                  'تعتمد تطبيقة وقاية على تقنية البلوتوث و تستوجب أن يتم تحميلها و استعمالها من أكثر عدد ممكن من المواطنين',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle()),
                              Text(
                                  'تتطلب تطبيقة وقاية تسجيل أولي اثر التحميل و من ثم فتحها هي و البلوتوث. لا تتطلب التطبيقة تفاعل آخر من المواطنين',
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
                  child: Column(children: <Widget>[
                    Image.asset(
                      'lib/assets/about.png',
                      height: height * 0.1,
                    ),
                    Text(
                      'عن التطبيقة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff3f3d56),
                        fontSize: height * 0.03,
                      ),
                    ),
                  ]),
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'lib/assets/tawasol.png',
                      height: height * 0.1,
                    ),
                    Text(
                      'تواصل معنا',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff3f3d56),
                        fontSize: height * 0.03,
                      ),
                    ),
                  ],
                ),
                Builder(builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      share(context);
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'lib/assets/share.png',
                          height: height * 0.1,
                        ),
                        Text(
                          'شارك التطبيقة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff3f3d56),
                            fontSize: height * 0.03,
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Title"),
            content: new Text("This is one time dialog"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Dismiss"),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
