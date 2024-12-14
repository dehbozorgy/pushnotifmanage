import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushnotifmanage/PageSubscribe/PageSubscribe.dart';
import 'package:pushnotifmanage/PageUser/PageUser.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context){
        ScreenUtil.init(context, designSize: const Size(360, 690));
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PageSubscribe()));
                  },
                  child: Text('Page Subcription',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      )
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PageUser()));
                  },
                  child: Text('Page User',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      )
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)
                  )
              ),
            ],
          ),
        );
      }),
    );
  }
}

