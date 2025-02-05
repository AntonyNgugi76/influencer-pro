import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'analytics_viewmodel.dart';

class AnalyticsView extends StackedView<AnalyticsViewModel> {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AnalyticsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AnalyticsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AnalyticsViewModel();
}
