import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:pushnotifmanage/PageUser/Component/DataUser.dart';
import 'package:pushnotifmanage/main.dart';

class PageUser extends StatefulWidget {
  const PageUser({super.key});

  @override
  State<PageUser> createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  
  Future<List<DataUser>> AllUser() async {

    int i1 = 2;

    Response response = await get(Uri.parse('http://192.168.8.100:3000/user/getAllUser'));
    var result = jsonDecode(response.body);

    List<DataUser> lstUser = [];

    for(var data in result['data']){
      lstUser.add(DataUser.fromJson(data));
    }

    int i2 = 2;

    return lstUser;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<DataUser>>(
              future: AllUser(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      padding: EdgeInsets.symmetric(
                        vertical: 15
                      ),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                       return Center(
                         child: Container(
                           width: 0.9.sw,
                           padding: EdgeInsets.all(7),
                           margin: EdgeInsets.symmetric(
                             vertical: 15
                           ),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color: Colors.white,
                               boxShadow: [
                                 BoxShadow(
                                     color: Colors.black,
                                     blurRadius: 5,
                                     blurStyle: BlurStyle.outer,
                                     spreadRadius: 0
                                 )
                               ]
                           ),
                           child: IntrinsicHeight(
                             child: Row(
                               mainAxisSize: MainAxisSize.max,
                               crossAxisAlignment: CrossAxisAlignment.stretch,
                               children: [
                                 Image.asset(snapshot.data!.elementAt(index).avatar,
                                     width: 80,height: 80),
                                 VerticalDivider(),
                                 Text('Name : ${snapshot.data!.elementAt(index).name}',
                                   style: TextStyle(
                                     fontSize: 20.sp,
                                     fontWeight: FontWeight.bold
                                   ))
                               ],
                             ),
                           ),
                         ),
                       );
                      }
                  );
                }
                else if(snapshot.hasError){
                  return Text('Error => ${snapshot.error}');
                }
                else{
                  return SizedBox(
                    width: 50,
                    height: 50,
                      child: CircularProgressIndicator(strokeWidth: 5,color: Colors.indigo));
                }
              }
          ),
        ),
      ),

    );
  }

}
