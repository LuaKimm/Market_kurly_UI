import 'package:intl/intl.dart';

extension StringExtension on String { //string객체를 확장하겠다는 의미
  String numberFormat() {
    final formatter = NumberFormat("#,###"); //천단위 콤마
    return formatter.format(int.parse(this));
  }
}