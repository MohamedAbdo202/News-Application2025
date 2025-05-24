import 'package:flutter/cupertino.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    required this.text,
    required this.textStyle,
    super.key,
    this.maxLines = 5,
    this.textAlign = TextAlign.start,
  });

  /// Reusable Text

  final String text;
  final TextStyle textStyle;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      text,
      style: textStyle,
    );
  }
}
