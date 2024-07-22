import 'package:influencer_pro/app/app.bottomsheets.dart';
import 'package:influencer_pro/app/app.dialogs.dart';
import 'package:influencer_pro/app/app.locator.dart';
import 'package:influencer_pro/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String instagramId = '9bb8913b-ddd9-430b-a66a-d74d846e6c66';
 String youtubeId = '14d9ddf5-51c6-415e-bde6-f8ed36ad7054';
}
