import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/service/dio_helper/endPoint.dart';
import 'package:tasks_app/src/app_colors_class.dart';


class DropDownItem extends StatefulWidget {
  String state;

  DropDownItem(this.state);

  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {

  @override
  Widget build(BuildContext context) {
    String dropDownValue =widget.state;
    var items = [
      'new',
      'in_progress',
      'completed',
      'outDate',
    ];
    return
       Center(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 20.w),
           decoration: BoxDecoration(
             border: Border.all(width: 2.w)
           ),
           child: DropdownButton(
             dropdownColor: Colors.white,

             style: TextStyle(color: Colors.black, fontSize: 25.sp),
              value: dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
             items: items.map((String items) {
               return DropdownMenuItem(
                 value: items,
                 child: Text(items),
               );
             }).toList(),

             onChanged: (String? newValue) {
               setState(() {
                 dropDownValue = newValue!;
                 widget.state=newValue;
                 status=newValue;
               });
             },
           ),
         ),
       );
  }
}
