//appBar(맨위)의 아이콘 위젯 - 자주 사용하므로 미리 만들기, 핀 + 장바구니

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'stack_icon.dart';

class CustomActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 38,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/pin.svg",
                  color: Colors.white,
                )),
          ),
          SizedBox(
            width: 38,
            child: StackIcon(
              imgPath: "assets/icons/shopping-cart.svg",
              onPressed: () {},
              counter: "2",
            ),
          )
        ],
      ),
    );
  }
}