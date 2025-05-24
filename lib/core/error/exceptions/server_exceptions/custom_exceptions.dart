import 'package:news/core/constants/exception_enums.dart';

class CustomException implements Exception {
  CustomException(this.type, this.imgPath, {this.errorMassage = ''});

  CustomStatusCodeErrorType type;
  String errorMassage;
  String imgPath;

  @override
  String toString() {
    return 'SomeThing Wrong Happen: \n$type';
  }
}
