import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../theme.dart';
import 'components/body.dart';
import '../components/default_button.dart';
import '../../models/product_details_arguments.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    // 화면이 갱신될 때, build 메서드가 호출될 때 ModalRoute 객체 이용해서 arguments 속성 받을 수 있다.
    // arguments타입 Object 이므로 ProductDetailsArguments 객체로 데이터 자료형 변환해줘야함. as 키워드로 형 변환 가능
    final arguments =
    ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "${arguments.product.title}",
          style: textTheme().titleMedium?.copyWith(color: Colors.black),
        ),
      ),
      // 2
      body: Body(product: arguments.product),
      bottomNavigationBar: SafeArea( //하단의 노치 영역과 위젯 사이 충분한 패딩
        child: Column( //bottomNavigationBar 크기에 제약 주기 위해 사용 column 없으면 화면 꽉채움
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding( //위젯 양쪽 패딩 추가
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DefaultButton(
                text: "구매하기",
                color: kPrimaryColor,
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}