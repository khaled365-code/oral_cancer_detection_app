import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            //! Profile Picture
            CircleAvatar(
              radius: 80,
              backgroundImage:AssetImage('assets/images/img.png'),
            ),
            const SizedBox(height: 16),
            Center(child: Text("Eman Ashraf",style: AppTextStyles.font20,)),
            //! Name
            const SizedBox(height:40),
            //! Email
            ListTile(
              title: Text("email"),
              leading: const Icon(Icons.email),
            ),
          ],
        ),
      ),
    );
  }


}