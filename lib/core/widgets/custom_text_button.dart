import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({super.key , required this.textState ,required this.onPressed,this.bIcon});

  final String textState;
  VoidCallback onPressed;
  final Icon? bIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return AppColors.primary;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8,vertical:4),
        child: Row(
          children: [
            Text(textState ,
              style:const TextStyle(fontSize:16, color: Colors.white) ,
            ),
            const SizedBox(width: 4),
            if (bIcon != null) bIcon!,
            const SizedBox(width: 4),


          ],
        ),
      ),
    );
  }
}