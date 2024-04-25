import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/snackbar.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_language_cubit.dart';
import 'drawer_body_item.dart';

class LanguageDrawerItem extends StatefulWidget {
  @override
  State<LanguageDrawerItem> createState() => _LanguageDrawerItemState();
}

class _LanguageDrawerItemState extends State<LanguageDrawerItem> {
  String pressedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeLanguageCubit,ChangeLanguageState>(
      listener: (context, state) {
        if(state is ChangeLanguageSuccessState){
          showSnackBar(context, content: state.userMessage);
        }
      },
      builder: (context, state) {
        return DrawerItem(
          text:"language".tr(context),
          image: ImageConstants.language,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                    CupertinoAlertDialog(
                      title: Text("language".tr(context),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () {
                                pressedLanguage = 'en';
                                setState(() {

                                });

                                context
                                    .read<ChangeLanguageCubit>()
                                    .pressedLanguage = pressedLanguage;
                                context.read<ChangeLanguageCubit>()
                                    .updateLanguage();
                                navigate(context: context,
                                    route: Routes.loginScreen);
                              },
                              child: Text("english".tr(context),
                                  style: AppTextStyles.font16)),
                          Divider(
                              thickness: 2,
                              indent: 1,
                              endIndent: 1,
                              color: AppColors.grey),
                          TextButton(
                              onPressed: () {
                                pressedLanguage = 'ar';
                                setState(() {

                                });
                                context
                                    .read<ChangeLanguageCubit>()
                                    .pressedLanguage = pressedLanguage;
                                context.read<ChangeLanguageCubit>()
                                    .updateLanguage();
                                navigate(context: context,
                                    route: Routes.loginScreen);
                              },
                              child: Text("arabic".tr(context),
                                  style: AppTextStyles.font16)),
                        ],
                      ),
                    ));
          },
        );
      },
    );
  }
}