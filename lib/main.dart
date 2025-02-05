import 'package:flutter/material.dart';
import 'package:influencer_pro/app/app.bottomsheets.dart';
import 'package:influencer_pro/app/app.dialogs.dart';
import 'package:influencer_pro/app/app.locator.dart';
import 'package:influencer_pro/app/app.router.dart';
import 'package:influencer_pro/state/phyllo_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => PhylloProvider())
            ],
            child: MaterialApp(
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
            ));
      }
    );
  }
}
