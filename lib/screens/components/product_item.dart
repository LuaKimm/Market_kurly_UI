import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product_details_arguments.dart';
import 'package:market_kurly_ui/screens/details/details_screen.dart';
import '../../models/product.dart';
import '../../theme.dart';
import '../../string_extensions.dart'; // 직접 import 하기

class ProductItem extends StatelessWidget {
  final Product product;
  final bool? lineChange;
  final double? textContainerHeight;

  const ProductItem(
      {Key? key,
        required this.product,
        this.lineChange = false,
        this.textContainerHeight = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 2
        Expanded( //이미지 파일 중요한 부분은 expanded로 감싸고 세로 크기는 사용하는 부모 위젯에서 결정
          child: InkWell(
            onTap: () {
              Navigator.pushNamed( //Navigator 객체의 arguments 속성을 이용해 객체를 전달
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(product: product),
              );
            },
            child: Image.network(
              product.imageUrl ?? "assets/images/kurly_banner_0.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 3
        Container( //textrich 위젯 사용 글자 스타일 추가
          height: textContainerHeight,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${product.title} ${lineChange == true ? "\n" : ""}",
                    style: textTheme().titleMedium),
                TextSpan(
                  text: " ${product.discount}% ",
                  style: textTheme().displayMedium?.copyWith(color: Colors.red),
                ),
                TextSpan(
                    text: discountPrice(
                        product.price ?? 0, product.discount ?? 0),
                    style: textTheme().displayMedium),
                // 4
                TextSpan(  //numberFormat()함수 사용 모습
                  text: "${product.price.toString().numberFormat()}원",
                  style: textTheme().bodyMedium?.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }

  // 5 할인율 따라 가격 계산 함수
  String discountPrice(int price, int discount) {
    double discountRate = ((100 - discount) / 100);
    int discountPrice = (price * discountRate).toInt();
    return "${discountPrice.toString().numberFormat()}원 ";
  }
}