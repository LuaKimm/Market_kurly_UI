//기본적으로 사요할 스타일의 버튼 위젯

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../theme.dart';

class DefaultButton extends StatelessWidget {
  final String? text;  //버튼 안에 표시할 텍스트 (예: "로그인", "확인")
                       // → nullable(?)이기 때문에 null일 수도 있음
  final GestureTapCallback? press; //	버튼을 눌렀을 때 실행할 함수(onTap)
  final Color color;

  const DefaultButton(
      {Key? key, this.text, this.press, this.color = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(16),
      ),
      onPressed: press,
      child: Center(
        child: Text(
          text ?? "",
          style: textTheme().titleMedium,
        ),
      ),
    );
  }
}