import 'package:flutter/material.dart';

import '../src/app_colors_class.dart';


class DateBottom extends StatefulWidget {
String title;
Function(DateTime?) onValue;
DateTime? date;
  DateBottom({required this.title, required this.onValue, this.date});

  @override
  State<DateBottom> createState() => _DateBottomState();
}

class _DateBottomState extends State<DateBottom> {
  bool dateChose=false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              AppColors.kMainColor)),
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: widget.date ?? DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2028),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.kMainColor,
                  onPrimary: Colors.white,
                  onSurface: Colors.blueAccent,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.kMainColor, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        ).then((value) {
          widget.onValue(value);
          if(value==null) {
            return DateTime.now();
          } else{
            setState(() {
              widget.date=value;
              dateChose=true;
            });
          }
        });
      },
      child:dateChose?Text('${widget.date?.year}/${widget.date?.month}/${widget.date?.day}'):Text(widget.title),
    );
  }
}
