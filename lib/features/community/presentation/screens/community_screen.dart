import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/community/presentation/screens/no_posts_screen.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../data/models/post_data_model.dart';
import '../widgets/post_container.dart';

class CommunityScreen extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCommunityBloc, GlobalCommunityBlocState>(
      builder: (context, state) {
        final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      PostContainer(
                       postDataModel: communityBloc.postsDataList[index],
                        currentIndex: index,
                      ),
                  itemCount: communityBloc.postsDataList.length,
                ),
              ),
            ],
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              navigate(context: context, route: Routes.addPostScreen);
            },
            child: Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                    color: AppColors.c4C9EEB,
                    shape: BoxShape.circle
                ), child: Image.asset(ImageConstants.addTwitterTextImage)),
          ),


        );
      },
    );
  }
}



