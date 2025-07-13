import 'package:flutter/material.dart';
import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(MarketKurly());
}

class MarketKurly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Market Kurly UI",
      initialRoute: SplashScreen.routeName,//앱에 첫 화면을 지정하는 속성
      routes: route, //플러터에 Navigation화면들을 등록하는 부분. routes.dart 파일에서 만들었던 map<String, WidgetBuilder> 자료형 변수 route 입력
      theme: theme(), //theme.dart 파일에서 정의한 ThemeData 객체 등록
    );
  }
}