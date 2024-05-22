import 'package:flutter/material.dart';
import 'componants/upload_image_body.dart';

class UploadImageView extends StatelessWidget {
  const UploadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UploadImageBody(),
    );

  }
}
