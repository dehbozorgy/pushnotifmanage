import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Component/WidgetWaiting.dart';
import '../FlutterToken.dart';
import '../Funcs.dart';
import 'Component/CartSubscribe.dart';
import 'Component/DataSubscribe.dart';

class PageSubscribe extends StatelessWidget {
  PageSubscribe({super.key});

  List<DataSubscribe> lst = [
    DataSubscribe(Title: 'فوتبال آقایان', Topic: 'men_football', pngPath: 'assets/sport/a.png'),
    DataSubscribe(Title: 'فوتبال بانوان', Topic: 'women_football', pngPath: 'assets/sport/b.png'),
    DataSubscribe(Title: 'تنیس', Topic: 'tennis', pngPath: 'assets/sport/c.png'),
    DataSubscribe(Title: 'پینگ پنگ', Topic: 'ping_pong', pngPath: 'assets/sport/d.png'),
    DataSubscribe(Title: 'وزنه برداری', Topic: 'weight_lifting', pngPath: 'assets/sport/e.png'),
    DataSubscribe(Title: 'دوچرخه سواری', Topic: 'cycling', pngPath: 'assets/sport/f.png'),
  ];

  Future SendFromServer(Map data) async {

    var uri = 'http://192.168.8.100:3000/user/SendNotif';

    Response res = await post(Uri.parse(uri),
        headers: {'Content-type':'application/json'},
        body: jsonEncode(data));

    int ii = 2;

    return true;

  }

  Future SendNotif(String Topic,Map<String,String> data) async {

    String body = jsonEncode({
      "message": {
        // "token": _tokenEmulator,
        "topic": Topic,
        "notification": {},
        "data": data
      }
    });

    String token = await getAccessToken();

    String uri = "https://fcm.googleapis.com/v1/projects/navid-noti2/messages:send";

    Response response = await post(Uri.parse(uri),
        headers: {
          'Authorization':'Bearer $token'
        },
        body: body
    );

    var res = response.body;

    print('Notif Result ===>>> $res');

    int ii = 2;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: ListView.builder(
           itemCount: lst.length,
           shrinkWrap: true,
           physics: BouncingScrollPhysics(),
           padding: EdgeInsets.symmetric(
               vertical: 15
           ),
           itemBuilder: (context,index){
             return CartSubscribe(
                 dataSubscribe: lst.elementAt(index),
                 callBack: () async {

                   DataSubscribe dataSubscribe = lst.elementAt(index);

                   String Topic = dataSubscribe.Topic;

                   // By Mobile
                   Map<String,String> data = {
                     'title':Topic,
                     'body':Topic
                   };

                   await showMessageBox(context, WidgetWaiting(InputFunction: SendNotif(Topic,data)));

                   // By Server
                   // Map data = {
                   //   'topic':  Topic,
                   //   'title':  Topic,
                   //   'body':  Topic,
                   // };
                   //
                   // await showMessageBox(context, WidgetWaiting(InputFunction: SendFromServer(data)));

                 }
             );
           },
         ),
       ),
    );
  }

}
