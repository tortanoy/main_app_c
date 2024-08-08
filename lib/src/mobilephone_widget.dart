import 'package:flutter/material.dart';
import 'package:main_app_b/utils/string_utils.dart';

class MobilePhoneWidget extends StatelessWidget {
  @override

  String maskedNumber = StringUtils.maskPhoneNumber('0894441234');

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child: Text(
          '$maskedNumber',
          style: TextStyle(
            fontFamily: 'Sarabun',
            color: Colors.blueAccent,
            fontSize: 16,             
          )
        )

    );
  }
}