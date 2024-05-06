

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../utilis/app_text_styles.dart';
import '../utilis/colors.dart';

void navigate({required context ,required String route,arg})
{
  Navigator.pushNamed(context, route,arguments: arg);

}

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


void showToast({required String msg,required ToastStates toastStates}) async
{
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastStates),
      textColor: Colors.black,
      fontSize: 16.0
  );

}

Future<XFile?> imagePick({required ImageSource imageSource}) async
{
  XFile? image =await ImagePicker().pickImage(source: imageSource);
  return image!=null? image : null;

}

enum ToastStates{success,error,warning}

Color getColor(ToastStates toastStates)
{
  switch (toastStates)
  {
    case ToastStates.success:
      return AppColors.red;
    case ToastStates.error:
      return Colors.red;
    case ToastStates.warning:
      return AppColors.red;
  }
}

showSnackBar(BuildContext context,{required String content}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,style: AppTextStyles.font12,)
        ,backgroundColor: AppColors.white,
        behavior: SnackBarBehavior.floating,
      )
  );
}

getTimeDifference({required DateTime postDate})
{
  DateTime currentTime=DateTime.now();

  Duration difference=currentTime.difference(postDate);

  int differenceInDays=difference.inDays;
  int differenceInHours=difference.inHours;
  int differenceInMinutes=difference.inMinutes;
  int differenceInSeconds=difference.inSeconds;


  if(differenceInDays>0)
  {
    return '${differenceInDays}d';
  }
  else if(differenceInHours>0)
  {
    return '${differenceInHours}h';
  }
  else if(differenceInMinutes>0)
  {
    return '${differenceInMinutes}m';
  }
  else
  {
    return '${differenceInSeconds}s';
  }

}
// String formatDateTime(String dateTimeString) {
//
//
//   DateTime dateTime = DateTime.parse(dateTimeString);
//
//   String formattedTime = DateFormat.Hm().format(dateTime);
//
//   return formattedTime;
// }


