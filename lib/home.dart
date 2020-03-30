import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //
  String text = 'wikayaaa';
  String subject = 'wikayaa balalalllaabbblablzlbzlblzb';

  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(78.0),
              child: Container(
                  child: Image.asset(
                'lib/assets/logo.png',
                scale: 0.5,
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
}
