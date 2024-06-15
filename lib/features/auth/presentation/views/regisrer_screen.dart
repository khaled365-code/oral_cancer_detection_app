import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/auth/presentation/widgets/register_page_body.dart';


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

