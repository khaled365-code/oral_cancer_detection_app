import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/home/presentation/componants/upload_image_body.dart';

class UploadImageView extends StatelessWidget {
  const UploadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UploadImageBody(),
    );

  }
}
