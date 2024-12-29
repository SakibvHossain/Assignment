import 'package:get/get.dart';

class BottomNav extends GetxController{
  RxInt selectedIndex = 0.obs;


  //For Carousal Slider dots
  RxInt carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }
}