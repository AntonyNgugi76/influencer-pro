import 'package:flutter_test/flutter_test.dart';
import 'package:influencer_pro/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AnalyticsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
