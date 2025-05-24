import 'package:flutter/material.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/models/models/article_model.dart';
import 'package:news/util/app_constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButtonWidget extends StatelessWidget {
  const UrlButtonWidget({
    super.key,
    required this.item,
  });

  final Article item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _launchURL(item.url);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.blueColor, // Change this color as needed
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
            child: CommonText(
                text: 'Read Full Article',
                textStyle: Styles.whiteColorStyle18)),
      ),
    );
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
