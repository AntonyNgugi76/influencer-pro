import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influencer_pro/ui/views/wrapper/wrapper_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';
import 'package:influencer_pro/ui/common/app_colors.dart';
import 'package:influencer_pro/ui/common/ui_helpers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../state/phyllo_provider.dart';
import '../../../utils/loader.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<WrapperViewModel> {
  // final viewModel vie
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WrapperViewModel viewModel,
    Widget? child,
  ) {
    return Consumer<PhylloProvider>(
      builder: (context, phylloProvider, child) {
        return Scaffold(
          backgroundColor: kcBackgroundColor,
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: kcPrimaryColor,
              label: Row(
                children: [
                  // Icon(Icons.add, color: Colors.white,),
                  SvgPicture.asset('assets/svgs/plus.svg', color: kcWhiteColor),
                  horizontalSpaceSmall,
                  Text(
                    'Post',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 12.sp),
                  ),
                ],
              )),
          appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        print('yes');
                        viewModel.setIndex(4);
                      },
                      child: CircleAvatar(
                        backgroundColor: kcWhiteColor,
                        radius: 3.h,
                        child: CircleAvatar(
                          backgroundColor: kcPrimaryColor,
                          radius: 2.8.h,
                          child: SvgPicture.asset('assets/svgs/profile.svg',
                              color: kcWhiteColor),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hey',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 12.sp),
                        ),
                        Text(
                          'Ngugi Antony!',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svgs/bell.svg',
                        height: 4.h,
                        color: kcWhiteColor,
                      ),
                    )
                  ],
                ),
              ),
              toolbarHeight: 7.h,
              elevation: 0,
              backgroundColor: kcPrimaryColor),
          body: Padding(
            padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Statistics',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 12.sp),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.setIndex(0);
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kcBlueColor,
                                fontSize: 11.sp),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,

                    Container(
                        height: 24.8.h,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: const BoxDecoration(
                            // color: kcWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,
                              enableInfiniteScroll: false,
                              // height: 200.0,
                              onPageChanged: viewModel.onChanged),
                          items: [
                            MyWidget(
                              topDrawable: 'assets/svgs/flame.svg',
                              title: 'Total Views',
                              widget: SizedBox(
                                height: 20.h,
                                width: MediaQuery.of(context).size.width,
                                child: SfCircularChart(
                                  legend: const Legend(
                                      alignment: ChartAlignment.center,
                                      position: LegendPosition.right,
                                      isVisible: true),
                                  series: <CircularSeries>[
                                    PieSeries<PieData, String>(
                                      dataSource: getPieData(),
                                      xValueMapper: (PieData data, _) =>
                                          data.category,
                                      yValueMapper: (PieData data, _) =>
                                          data.value,
                                      pointColorMapper: (PieData data, _) =>
                                          data.color,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            MyWidget(
                              topDrawable: 'assets/svgs/clock.svg',
                              title: 'Watch Hours',
                              widget: SizedBox(
                                height: 20.h,
                                width: MediaQuery.of(context).size.width,
                                child: SfCircularChart(
                                  legend: const Legend(
                                      alignment: ChartAlignment.center,
                                      position: LegendPosition.right,
                                      isVisible: true),
                                  annotations: <CircularChartAnnotation>[
                                    CircularChartAnnotation(
                                      widget: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "23, 509",
                                            style: TextStyle(
                                                height: 1.1,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          const Text(
                                            "Total",
                                            style: TextStyle(
                                                height: 1.1,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                  series: <CircularSeries>[
                                    DoughnutSeries<DoughnutData, String>(
                                      dataSource: getDoughnutData(),
                                      xValueMapper: (DoughnutData data, _) =>
                                          data.category,
                                      yValueMapper: (DoughnutData data, _) =>
                                          data.value,
                                      pointColorMapper:
                                          (DoughnutData data, _) => data.color,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),

                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Platforms',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 12.sp),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.setIndex(0);
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kcBlueColor,
                                fontSize: 11.sp),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
                    Container(
                        height: 14.h,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: const BoxDecoration(
                            // color: kcWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.socials.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return SocialCard(
                                value: viewModel.socials[index].name,
                                onPressed: () {},
                                topDrawable: viewModel.socials[index].icon,
                              );
                            })),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earnings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 12.sp),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.setIndex(0);
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kcBlueColor,
                                fontSize: 11.sp),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       PrimaryButton(
                    //         label: 'Connect Platform Account(S)',
                    //         onPressed: () {
                    //           phylloProvider.launchSdk('');
                    //         },
                    //       ),
                    //       const SizedBox(height: 20),
                    //       PrimaryButton(
                    //         label: 'Connect Instagram using Phyllo',
                    //         onPressed: () {
                    //           phylloProvider.launchSdk(viewModel.instagramId);
                    //         },
                    //       ),
                    //       const SizedBox(height: 20),
                    //       PrimaryButton(
                    //         label: 'Connect YouTube using Phyllo',
                    //         onPressed: () {
                    //           phylloProvider.launchSdk(viewModel.youtubeId);
                    //         },
                    //       ),
                    //       const SizedBox(height: 10),
                    //       // _buildExistingUserCheckbox(),
                    //     ],
                    //   ),
                    // ),
                    // Loader.loadingWithBackground(phylloProvider.isLoading),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  WrapperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WrapperViewModel();
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final double height;
  final double? width;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return MaterialButton(
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, letterSpacing: 0.5),
      ),
      height: height,
      minWidth: width ?? mq.size.width,
      elevation: 0,
      highlightElevation: 0,
      textColor: Colors.white,
      color: kcPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
    );
  }
}

class SocialCard extends StatelessWidget {
  // final String label;
  final String topDrawable;
  final String value;
  final VoidCallback onPressed;

  const SocialCard({
    Key? key,
    // required this.label,
    required this.onPressed,
    required this.topDrawable,
    // required this.centerDrawable,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kcWhiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceSmall,
              Container(
                  height: 10.h,
                  width: 10.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(topDrawable), fit: BoxFit.cover))),
              verticalSpaceSmall,
              // Text(
              //   value,
              //   style: TextStyle(fontSize: 20.sp, letterSpacing: 0.5),
              // ),
            ],
          )),
    );
  }
}

class DialogButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const DialogButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.borderColor = kcPrimaryColor,
    this.backgroundColor = kcLightGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(100, 34),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: borderColor),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;
  final String topDrawable;

  // final String title;
  final Widget widget;

  const MyWidget(
      {super.key,
      required this.title,
      required this.widget,
      required this.topDrawable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0.h),
      // width: MediaQuery.of(context).size.width*0.5,
      height: 16.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
              children: [
                SvgPicture.asset(topDrawable),
                horizontalSpaceSmall,
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      letterSpacing: 0.5),
                ),
              ],
            ),
            widget
          ])),
    );
  }
}

class PieData {
  final String category;
  final double value;
  final Color color;

  PieData(this.category, this.value, this.color);
}

List<PieData> getPieData() {
  final List<PieData> pieData = [
    PieData('YouTube', 30, kcYoutubeColor),
    PieData('TikTok', 20, kcTikTokColor),
    PieData('Instagram', 25, kcInstagramColor),
  ];
  return pieData;
}

class DoughnutData {
  final String category;
  final double value;
  final Color color;

  DoughnutData(this.category, this.value, this.color);
}

List<DoughnutData> getDoughnutData() {
  final List<DoughnutData> doughData = [
    DoughnutData('Youtube', 30, kcYoutubeColor),
    DoughnutData('TikTok', 20, kcTikTokColor),
    DoughnutData('Instagram', 25, kcInstagramColor),
  ];
  return doughData;
}
