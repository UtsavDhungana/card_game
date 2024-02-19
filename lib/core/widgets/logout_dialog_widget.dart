import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        StringConstant.logoutText,
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
      content: const Text(
        StringConstant.logoutConfirmationText,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              StringConstant.yesText,
            )),
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text(
            StringConstant.noText,
          ),
        ),
      ],
    );
  }
}
