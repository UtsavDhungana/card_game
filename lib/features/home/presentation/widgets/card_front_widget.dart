import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silk_innovation_utsav/core/constants/constants.dart';

class CardFront extends StatelessWidget {
  final int cardNumber;
  final bool isMatched;
  const CardFront({
    super.key,
    required this.cardNumber,
    required this.isMatched,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 10.0.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0.r,
        ),
        color: isMatched ? AppColors.lightGreyColor : Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 9, 9, 9),
            blurRadius: 2.0.r,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: isMatched ? AppColors.blueshGreyColor : Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            8.0.r,
          ),
        ),
        child: Center(
          child: Text(
            cardNumber.toString(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 25.0.sp,
                  color:
                      isMatched ? AppColors.greyColor : AppColors.primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
