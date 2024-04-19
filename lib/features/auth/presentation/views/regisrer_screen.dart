import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_appbar.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/register_page_body.dart';


class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     backgroundColor: AppColors.primary,
     body: RegisterBody(),
       );
  }
}

