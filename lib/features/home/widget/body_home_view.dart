import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_image.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/core/widget/custom_app_bar_pages.dart';
import 'package:islami_app/core/widget/custom_divider.dart';
import 'package:islami_app/features/home/model/sura_name_model.dart';
import 'package:islami_app/features/home/widget/custom_scroll_sura_and_aya.dart';

class BodyHomeView extends StatefulWidget {
  const BodyHomeView({super.key});

  @override
  State<BodyHomeView> createState() => _BodyHomeViewState();
}

class _BodyHomeViewState extends State<BodyHomeView> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<SuraNameModel>> getSuras() async {
    String jsonData = await rootBundle.loadString('assets/json/surah.json');
    List myJsonDecode = json.decode(jsonData);
    //log(myJsonDecode.toString());
    List<SuraNameModel> suraData = [];
    for (var element in myJsonDecode) {
      suraData.add(SuraNameModel.fromJson(element));
    }
    return suraData;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return FutureBuilder(
        future: getSuras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppBarPages(),
                    Image.asset(AppImage.kQuranHeaderIconImage),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.42,
                          child: Text(
                            'إسم السورة',
                            style: AppStyle.elMessiriSemiBold25,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          // color: Colors.red,
                          height: 48,
                          child: VerticalDivider(
                            color: AppColor.kPrimaryColor,
                            thickness: 2.5,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.42,
                          child: Text(
                            'عدد الآيات',
                            style: AppStyle.elMessiriSemiBold25,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const CustomDivider(),
                    CustomScrollSuraAndAya(
                      suras: snapshot.data!,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: AppStyle.interRegular20,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
