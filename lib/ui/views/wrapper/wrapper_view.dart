import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:influencer_pro/ui/views/analytics/analytics_view.dart';
import 'package:influencer_pro/ui/views/chat/chat_view.dart';
import 'package:influencer_pro/ui/views/profile/profile_view.dart';
import 'package:influencer_pro/ui/views/wrapper/wrapper_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../home/home_view.dart';

class WrapperView extends StackedView<WrapperViewModel> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context,
      WrapperViewModel viewModel,
      Widget? child,) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.setIndex(2);
        },
        child: SvgPicture.asset('assets/svgs/home.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60.0, // Ensure there's enough height for the FAB's notch
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      viewModel.setIndex(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/svgs/analytics.svg',
                          color: viewModel.currentIndex == 0
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Analytics',
                          style: TextStyle(
                            color: viewModel.currentIndex == 0
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      viewModel.setIndex(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SvgPicture.asset('assets/svgs/message.svg',
                          color: viewModel.currentIndex == 1
                          ? Colors.blue
                          : Colors.grey,
                        ),
                        Text(
                          'Chats',
                          style: TextStyle(
                            color: viewModel.currentIndex == 1
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Right Side
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      viewModel.setIndex(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/svgs/chart-bar.svg',
                          color: viewModel.currentIndex == 3
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Trending',
                          style: TextStyle(
                            color: viewModel.currentIndex == 3
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      viewModel.setIndex(4);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/svgs/profile.svg',
                          color: viewModel.currentIndex == 4
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: viewModel.currentIndex == 4
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  WrapperViewModel viewModelBuilder(BuildContext context,) =>
      WrapperViewModel();
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return AnalyticsView();
    case 1:
      return ChatView();
    case 2:
      return HomeView();
    case 3:
      return HomeView();
    case 4:
      return ProfileView();

    default:
      return HomeView();
  }
}
