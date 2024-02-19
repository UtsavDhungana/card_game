import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class GameCompletedDialogWidget extends StatelessWidget {
  const GameCompletedDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        StringConstant.completedText,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      content: const Text(
        StringConstant.gameCompletedText,
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
