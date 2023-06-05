import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors_class.dart';


class HeadLineAdd extends StatelessWidget {
  String title;

  HeadLineAdd({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.start,color: AppColors.kMainColor,),
          SizedBox(width: 10.w,),
          Text('${title}',style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
