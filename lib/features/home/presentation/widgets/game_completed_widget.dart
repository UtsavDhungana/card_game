import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class GameCompletedDialogWidget extends StatelessWidget {
  final int totalAttempt;
  const GameCompletedDialogWidget({
    Key? key,
    required this.totalAttempt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        StringConstant.completedText,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.green,
            ),
      ),
      content: Text(
        "${StringConstant.gameCompletedText}\n\nTotal Attempts: $totalAttempt",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            StringConstant.okText,
          ),
        ),
      ],
    );
  }
}
