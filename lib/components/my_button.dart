
import 'package:flutter/material.dart';

import '../src/app_colors_class.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback function;

  MyButton({required this.label, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kMainColor,
        ),
        child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white,fontSize: 20),
            )),
      ),
    );
  }
}
