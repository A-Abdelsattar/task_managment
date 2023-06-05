import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors_class.dart';


class StatusBottom extends StatelessWidget {
  final title;
  final function;
  bool isActive;


  StatusBottom({required this.title, required this.function, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isActive ? AppColors.kMainColor : Colors.blueGrey.withOpacity(0.4)
        ),
        child: Center(
          child: Text(title,style: TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
