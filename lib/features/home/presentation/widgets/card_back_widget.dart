import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBack extends StatelessWidget {
  const CardBack({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0.r,
        ),
      ),
      child: Image.asset(
        "assets/images/cardBack.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
