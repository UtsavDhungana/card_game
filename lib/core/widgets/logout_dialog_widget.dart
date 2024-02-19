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
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        StringConstant.logoutConfirmationText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            StringConstant.yesText,
          ),
        ),
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
