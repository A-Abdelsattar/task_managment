import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors_class.dart';

class DashButton extends StatelessWidget {
 IconData icon;
 String title;
 final function;

 DashButton({required this.icon,required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 70.sp,
        width: 130.sp,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.kMainColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 10,),
            Text(title,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
