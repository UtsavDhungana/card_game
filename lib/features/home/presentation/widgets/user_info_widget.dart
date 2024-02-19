import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../login/presentation/cubit/login_cubit.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 12.0.h,
                      bottom: 5.0.h,
                    ),
                    child: Text(
                      "Hello, ${value.loginInfo.userInfo?.name ?? ''}",
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    StringConstant.welcomeText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
