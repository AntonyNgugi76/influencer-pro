
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../widgets/profile_card.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      ProfileViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
        // backgroundColor: kcPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:kcPrimaryColor ,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(color: kcPrimaryColor),
                  ),
                  ProfileCard(),
                ],
              ),
              verticalSpaceMedium,
              const Row(
                children: [
                  horizontalSpaceSmall,
                  Text(
                    'Settings',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: kcPrimaryColorDark),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 0.5, color: Color(0xffc5c5c5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/lock.svg'),
                        horizontalSpaceSmall,
                        Text(
                          'Change Pasword',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // viewModel.logout();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border:
                        Border.all(width: 0.5, color: Color(0xffc5c5c5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svgs/logout_icon.svg'),
                          horizontalSpaceSmall,
                          const Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 0.5, color: Color(0xffc5c5c5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/lock.svg',
                            color: Colors.red),
                        horizontalSpaceSmall,
                        Text(
                          'Delete Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  ProfileViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ProfileViewModel();
}
