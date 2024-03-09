



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilis/app_colors.dart';

class NotificationContainerItem extends StatelessWidget {

  NotificationContainerItem({required this.text, required this.itemSwitched,required this.onChanged});
  final String text;
  final bool itemSwitched;
  final void Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 62,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text(text),
          ),
          Spacer(),
          Switch(value: itemSwitched, onChanged: onChanged)
        ]));
  }
}