import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/profile/upddate/update_profile.dart';
import 'package:movies/bloc/states/profile/update_states.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/widget/profile/update_prifile/avatars_sheet_section.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider<UpdateProfileBloc>(
      create: (context) => UpdateProfileBloc()..getUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("pick_avatar".tr()),
        ),
        body: BlocConsumer<UpdateProfileBloc, UpdateStates>(
            listener: (context, state) {
          if (state is UpdateLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: Text("Loading.."),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )),
            );
          }
          if (state is UpdateSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouts.bottonNavigator, (r) => false);
          }
        }, builder: (context, state) {
          UpdateProfileBloc bloc = BlocProvider.of<UpdateProfileBloc>(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          useSafeArea: true,
                          context: context,
                          builder: (context) => AvatarsSheetSection(
                                bloc: bloc,
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Container(
                          height: 150,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppImages.avatars[bloc.avaterId],
                            height: 150,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ),
                  InputField(
                    controller: bloc.cName,
                    validate: () {},
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: InputField(
                      controller: bloc.cPhone,
                      validate: () {},
                      prefixIcon: Image.asset(AppImages.phoneIcon),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "reset_password".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                        )),
                  ),
                  SizedBox(
                    height: h * 0.15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonRed),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "delete_account_btn".tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      bloc.updateUser();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "update_data_btn".tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
