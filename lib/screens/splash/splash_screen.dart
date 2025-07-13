import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../main_screens.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "Kurly",
                    style: GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: TextButton(
                    child: Text("Continue"),
                    onPressed: () {
                      // 1 화면에서 continue 버튼을 누르면 _completeSplash 메서드 실행
                      // Navigator.pushreplacement 메서드는 이전 경로를 없애 주면서 새로운 화면 이동
                      //뒤로가기 눌러도 이전에 있던 화면은 나오지 않음
                      _completeSplash(context, MainScreens());
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}