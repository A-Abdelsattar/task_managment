import 'package:flutter/material.dart';
import 'package:tasks_app/service/dio_helper/dio_helper.dart';
import 'package:tasks_app/service/sp_helper/sp_helper.dart';
import 'package:tasks_app/service/sp_helper/sp_keys.dart';
import 'package:tasks_app/src/app_root.dart';

main()async{
    WidgetsFlutterBinding.ensureInitialized();
    await DioHelper.init();
    await SharedPreferenceHelper.init();
  runApp(AppRoot());
}