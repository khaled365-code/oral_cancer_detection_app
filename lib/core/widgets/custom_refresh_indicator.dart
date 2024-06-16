


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRefreshIndicator extends StatelessWidget {
  const MyRefreshIndicator({super.key, required this.refreshIndicatorKey, required this.child, required this.onRefresh});

  final Widget child;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid? buildRefreshIndicatorAndroid():buildRefreshIndicatorIOS();
  }



  buildRefreshIndicatorIOS()
  {
    return CustomScrollView(
      slivers:
      [
        CupertinoSliverRefreshControl(
          key: refreshIndicatorKey,
          onRefresh: onRefresh,
        ),
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }

  buildRefreshIndicatorAndroid()
  {
   return SliverToBoxAdapter(
     child: RefreshIndicator(
         edgeOffset: 1,
         child: child,
         onRefresh: onRefresh),
   );

  }





}


