import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/util/routes/router.dart';
import 'package:news/util/routes/routes_name.dart';

import '../../../util/app_constants/app_colors.dart';
import '../../styles/app_style.dart';
import '../common_text.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({
    this.title,
    this.showLeading = true,
    this.showAction = false,
    super.key,
  });

  final String? title;
  final bool showLeading;
  final bool showAction;

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0,
        automaticallyImplyLeading: showLeading,
        toolbarHeight: preferredSize.height,
        leading: showLeading
            ? Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 17.w,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 23,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            : null,
        actions: showAction
            ? [
                IconButton(
                  icon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.whiteColor,
                    size: 20,
                  ),
                  onPressed: () {
                    AppRouter.pushNamed(
                      Routes.searchPage,
                    );
                  },
                ),
              ]
            : [],
        centerTitle: true,
        title: CommonText(
          text: title!,
          textStyle: Styles.whiteColorStyle18,
        ));
  }
}
