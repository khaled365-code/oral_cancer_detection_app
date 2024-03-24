import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_appbar.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/login_page_body.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.only(top: 8),
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(double.infinity, 50),
            child:CustomFormAppBar()),
        body: LoginBody()
          ),
    );
  }
}


