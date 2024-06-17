
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilis/app_text_styles.dart';

void navigate({required context ,required String route,arg})
{
  Navigator.pushNamed(context, route,arguments: arg);

}

Future uploadImageToAPI(XFile image) async
{return MultipartFile.fromFile(image.path,
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
      textColor: Colors.white,
      fontSize: 14.0.sp
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
      return AppColors.primary;
    case ToastStates.error:
      return AppColors.primary;
    case ToastStates.warning:
      return AppColors.primary;
  }
}

showSnackBar(BuildContext context,{ Color? contentColor,String? content,Color? backgroundColor,Widget? specificWidget}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: specificWidget ??Text(
          content??'',style: AppTextStyles.font12.copyWith(color:contentColor??Colors.black ),)
        ,backgroundColor: backgroundColor??AppColors.white,
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
String getEmail({required String currentEmail})
{
  int emailLength=14;
  String displayedName=currentEmail.length>emailLength?currentEmail.substring(0,emailLength)+'.':currentEmail;
  return displayedName;


}
String getUserName({required String currentUserName})
{
  int userNameLength=16;
  String displayedName=currentUserName.length>userNameLength?currentUserName.substring(0,userNameLength)+'.':currentUserName;
  return displayedName;

}

Future<void> launchInAppWithBrowserOptions({required Uri url}) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
    //browserConfiguration: const BrowserConfiguration(showTitle: true),
  )) {
    throw Exception('Could not launch $url');
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}



