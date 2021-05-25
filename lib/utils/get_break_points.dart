import 'package:get/get.dart';

enum BreakPoints { mobile, tablet, desktop }
BreakPoints getBreakPoints() {
  if (Get.width < 480) {
    return BreakPoints.mobile;
  } else if (Get.width < 768) {
    return BreakPoints.tablet;
  } else {
    return BreakPoints.desktop;
  }
}
