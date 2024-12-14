import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DataSubscribe.dart';
import 'FadingEffect.dart';


class CartSubscribe extends StatelessWidget {

  final DataSubscribe dataSubscribe;

  final VoidCallback callBack;

  const CartSubscribe({
    super.key,
    required this.dataSubscribe,
    required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.9.sw,
        margin: EdgeInsets.symmetric(
            vertical: 15
        ),
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.outer
              )
            ],
            image: DecorationImage(image: AssetImage(dataSubscribe.pngPath)
                ,fit: BoxFit.fill,opacity: 0.8)
        ),
        clipBehavior: Clip.hardEdge,
        child: CustomPaint(
            foregroundPainter: FadingEffect(),
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(dataSubscribe.Title,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.indigo,
                            blurRadius: 10,
                          )
                        ]
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: callBack,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('ارسال',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.send,size: 30),
                      ],
                    ),
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
