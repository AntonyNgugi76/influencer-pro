import 'package:influencer_pro/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:influencer_pro/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:influencer_pro/ui/views/home/home_view.dart';
import 'package:influencer_pro/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:influencer_pro/services/phyllo_service.dart';
import 'package:influencer_pro/ui/views/wrapper/wrapper_view.dart';
import 'package:influencer_pro/ui/views/profile/profile_view.dart';
import 'package:influencer_pro/ui/views/analytics/analytics_view.dart';
import 'package:influencer_pro/ui/views/chat/chat_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: WrapperView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: AnalyticsView),
    MaterialRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // LazySingleton(classType: PhylloService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
