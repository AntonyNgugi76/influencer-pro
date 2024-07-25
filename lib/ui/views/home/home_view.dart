import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:influencer_pro/ui/common/app_colors.dart';
import 'package:influencer_pro/ui/common/ui_helpers.dart';

import '../../../state/phyllo_provider.dart';
import '../../../utils/loader.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Consumer<PhylloProvider>(
      builder: (context, phylloProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Phyllo Connect Example'),
            elevation: 0,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PrimaryButton(
                        label: 'Connect Platform Account(S)',
                        onPressed: () {
                          phylloProvider.launchSdk('');
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Connect Instagram using Phyllo',
                        onPressed: () {
                          phylloProvider.launchSdk(viewModel.instagramId);
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Connect YouTube using Phyllo',
                        onPressed: () {
                          phylloProvider.launchSdk(viewModel.youtubeId);
                        },
                      ),
                      const SizedBox(height: 10),
                      // _buildExistingUserCheckbox(),
                    ],
                  ),
                ),
                Loader.loadingWithBackground(phylloProvider.isLoading),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
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
