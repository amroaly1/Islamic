import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/core/widget/custom_app_bar_of_sub_page.dart';
import 'package:islami_app/features/alahdes/model/hadith_model.dart';

class BodyAlahdesDetailsView extends StatelessWidget {
  const BodyAlahdesDetailsView({super.key, required this.hadith});
  final HadithModel hadith;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBarOfSubPage(onPressed: () {
              Navigator.pop(context);
            }),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 26),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffF8F8F8).withOpacity(0.8),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              'الحديث',
                              style: AppStyle.interRegular25,
                            ),
                            const Spacer(flex: 2),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: hadith.hadith),
                                );
                              },
                              icon: const Icon(Icons.content_copy),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: AppColor.kPrimaryColor,
                          thickness: 1.5,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        hadith.hadith,
                        style: AppStyle.interRegular20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
