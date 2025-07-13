//KurlySignForm 로그인 폼 컴포넌트를 StatefulWidget 만들고,
//state 안에 입력값, 오류, 폼 유효성 검사를 관리.

import 'package:flutter/material.dart';
import 'package:market_kurly_ui/screens/signin/components/form_error.dart';
import '../../../constants.dart';
import '../../components/default_button.dart';
// import 'form_error.dart';

class KurlySignFrom extends StatefulWidget {
  @override
  _KurlySignFromState createState() => _KurlySignFromState(); //상태 객체 연결
}

class _KurlySignFromState extends State<KurlySignFrom> {
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); //Form 위젯을 제어 하기 위한 참조키 = useRef()
  final List<String> errors = [];
  String? id;
  String? password;
  String kIdNull = "아이디를 입력해주세요"; //null일때 보여줄 기본 에러 메시지 문자열
  String kPasswordNull = "비밀번호를 입력해주세요";

  @override
  Widget build(BuildContext context) {
    //return과 비슷 UI구성하는 위젯 나열
    return Form( //입력 필드를 감싸서 전체 유효성 검사할 수 있게함
      key: _formKey, //key를 부여해 validate()같은 메서드 호출 가능하게 만듬
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildIdlField(),
            SizedBox(height: 12),
            _buildPasswordField(),
            SizedBox(height: 20),
            DefaultButton(
              text: "로그인",
              press: () {
                if (_formKey.currentState!.validate() && errors.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('유효성 검사 확인'),
                    ),
                  );
                }
              },
            ), //errors 리스트 비어있는지 확인. 조건 만족시 snackBar로 메시지 보여줌
            SizedBox(height: 10),
            FormError(errors: errors)
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 1));
  }
  TextFormField _buildIdlField() {
    return TextFormField(
      onSaved: (newValue) => id = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kIdNull)) {
          setState(() {
            errors.remove(kIdNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kIdNull)) {
          setState(() {
            errors.add(kIdNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(kTextColor),
        focusedBorder: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(kPrimaryColor),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kIdNull,
      ),
    );
  }
  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kPasswordNull)) {
          setState(() {
            errors.remove(kPasswordNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kPasswordNull)) {
          setState(() {
            errors.add(kPasswordNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(kTextColor),
        focusedBorder: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(kPrimaryColor),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kPasswordNull,
      ),
    );
  }
}