//Navigator을 통해 이동되는 화면에 대한 주소를 문자열로 표현할 경우 문자열을 잘못 적어도 컴파일 시 오류가 발생하지 않기 때문에
//실수를 방지 하기 위해 전역함수로 작성하는 것이 좋은 방식이다.
import 'package:flutter/material.dart';
import 'screens/details/details_screen.dart';
import 'screens/main_screens.dart';
import 'screens/signin/signin_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  SignInScreen.routeName: (context) => SignInScreen(),
  // 1
  DetailsScreen.routeName: (context) => DetailsScreen()
};