import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_image.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/core/widget/custom_divider.dart';
import 'package:islami_app/features/alahdes/model/hadith_model.dart';

class BodyAlahdesView extends StatelessWidget {
  const BodyAlahdesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.kHadithHeaderImage),
                    const CustomDivider(),
                    const SizedBox(height: 7),
                    Text(
                      'الأحاديث',
                      style: AppStyle.elMessiriSemiBold25,
                    ),
                    const CustomDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: List.generate(
                          snapshot.data!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppViewsName.kAlAhadesDetailsView,
                                    arguments: snapshot.data![index]);
                              },
                              child: Text(
                                'الحديث رقم ${index + 1}',
                                style: AppStyle.interRegular25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: AppStyle.interRegular20,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<HadithModel>> getData() async {
    String jsonData = await rootBundle.loadString('assets/json/hadiths.json');
    var myJsonData = json.decode(jsonData);

    List<HadithModel> data = [];
    for (var element in myJsonData['hadiths']) {
      data.add(HadithModel.fromJson(element));
    }
    return data;
  }
}
