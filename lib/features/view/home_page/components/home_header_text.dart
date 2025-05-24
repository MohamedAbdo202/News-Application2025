import 'package:flutter/material.dart';
import 'package:news/common/styles/app_style.dart';

import '../../../../common/widgets/common_text.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(text: 'Discover', textStyle: Styles.blackColorStyle24),
            const SizedBox(
              height: 5,
            ),
            CommonText(
                text: 'News from all around the world',
                textStyle:
                    Styles.blackColorStyle15.copyWith(color: Colors.black54)),
          ],
        ));
  }
}
