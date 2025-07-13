//아이콘 위에 뱃지 숫자 표시 패턴

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class StackIcon extends StatelessWidget {
  final String? imgPath;
  final GestureTapCallback? onPressed;
  final String? counter;

  const StackIcon({
    Key? key,
    this.imgPath,
    this.onPressed,
    this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack( //<div style={{ position: 'relative' }}> 아이콘과 counter가 겹치게 표시되는 구조 장바구니 아이콘+숫자 배지 UI
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            imgPath ?? "assets/icons/shopping-cart.svg",
            color: Colors.white,
          ),
        ),
        Positioned( //<div style={{ position: 'absolute', top, right }}>
          top: 10,
          right: 5,
          child: Container(
            width: 14,
            height: 14,
            child: Center(
              child: Text(
                "$counter",
                style: TextStyle(fontSize: 10, color: kPrimaryColor),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        )
      ],
    );
  }
}