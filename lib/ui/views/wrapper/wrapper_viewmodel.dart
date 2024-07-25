import 'package:stacked/stacked.dart';

class WrapperViewModel extends BaseViewModel {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int currentIndexCarousel = 0;

  onChanged(int index, reason) {
    currentIndexCarousel = index;
    notifyListeners();
  }
  List<SocialMedia> socials = [
    SocialMedia(name: 'YouTube', icon: 'assets/images/you.png'),
    SocialMedia(name: 'Instagram', icon: 'assets/images/ins.png'),
    SocialMedia(name: 'TikTok', icon: 'assets/images/tok.png'),
  ];

}

class SocialMedia {
  String name;
  String icon;

  SocialMedia({required this.name, required this.icon});
}



