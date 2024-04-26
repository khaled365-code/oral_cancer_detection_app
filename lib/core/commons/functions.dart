

import 'package:flutter/material.dart';

void navigate({required context ,required String route,arg})
{
  Navigator.pushNamed(context, route,arguments: arg);

}


