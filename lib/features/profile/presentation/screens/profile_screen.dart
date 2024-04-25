import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/snackbar.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubites/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).GetUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context, state) {
       if(state is ProfileFailure){
         showSnackBar(context, content: state.errorMessage);
       }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:state is ProfileLoading? Center(child: CircularProgressIndicator()):
            state is ProfileSuccess? Column(
              children: [
                SizedBox(height:50.h),
                //! Profile Picture
                CircleAvatar(
                  radius:90.r,
                  backgroundColor: Colors.transparent,
                  // child: CachedNetworkImage(
                  //   imageUrl: state.userProfile.userImage,
                  //   fit: BoxFit.cover,
                  // ),
                  ),
                const SizedBox(height: 16),
                Center(
                    child: Text(state.userProfile.name, style: AppTextStyles.font20,)),
                //! Name
                const SizedBox(height: 40),
                //! Email
                ListTile(
                  title: Text(state.userProfile.email),
                  leading: const Icon(Icons.email),
                ),
              ],
            ):Text("ops"),
          ),
        );
      },
    );
  }
}