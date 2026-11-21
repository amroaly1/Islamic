import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_route.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/home/model/sura_name_model.dart';

class CustomScrollSuraAndAya extends StatefulWidget {
  const CustomScrollSuraAndAya({
    super.key,
    required this.suras,
  });
  final List<SuraNameModel> suras;
  @override
  State<CustomScrollSuraAndAya> createState() => _CustomScrollSuraAndAyaState();
}

class _CustomScrollSuraAndAyaState extends State<CustomScrollSuraAndAya> {
  late final ScrollController _controller1;
  late final ScrollController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = ScrollController();
    _controller2 = ScrollController();
    // Sync the scroll positions
    _controller1.addListener(() {
      if (_controller1.offset != _controller2.offset) {
        _controller2.jumpTo(_controller1.offset);
      }
    });

    _controller2.addListener(() {
      if (_controller2.offset != _controller1.offset) {
        _controller1.jumpTo(_controller2.offset);
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomListView(
              controller: _controller2,
              sura: widget.suras,
              isNumber: false,
            ),
          ),
          const VerticalDivider(
            color: AppColor.kPrimaryColor,
            thickness: 2.5,
            indent: 0,
            endIndent: 0,
            width: 16,
          ),
          Expanded(
            child: CustomListView(
              controller: _controller1,
              isNumber: true,
              sura: widget.suras,
            ),
          ),

          // const Spacer(),
        ],
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.controller,
      required this.sura,
      required this.isNumber});
  final ScrollController controller;
  final List<SuraNameModel> sura;
  final bool isNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.separated(
        controller: controller,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              Navigator.pushNamed(context, AppViewsName.kSuraView,
                  arguments: sura[index]);
            },
            child: AutoSizeText(
              isNumber
                  ? sura[index].numberOfAya.toString()
                  : sura[index].nameAr,
              style: AppStyle.interRegular25,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: sura.length,
      ),
    );
  }
}
