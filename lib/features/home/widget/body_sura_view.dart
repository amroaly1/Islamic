import 'dart:convert';
// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/widget/custom_app_bar_of_sub_page.dart';
import 'package:islami_app/features/home/manager/cubits/aya_cubit/aya_cubit.dart';
import 'package:islami_app/features/home/manager/cubits/aya_cubit/aya_state.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/home/model/sura_name_model.dart';

class BodySuraView extends StatefulWidget {
  const BodySuraView({super.key, required this.sura});
  final SuraNameModel sura;

  @override
  State<BodySuraView> createState() => _BodySuraViewState();
}

class _BodySuraViewState extends State<BodySuraView> {
  final List<GlobalKey> keys = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.sura.numberOfAya; i++) {
      keys.add(GlobalKey());
    }
    BlocProvider.of<AyaCubit>(context)
        .inital(widget.sura.index, widget.sura.numberOfAya, keys);
    // will immediately start playing;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAyas(widget.sura.numberOfAya, int.parse(widget.sura.index)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  CustomAppBarOfSubPage(
                    onPressed: () {
                      BlocProvider.of<AyaCubit>(context).playSound = false;
                      BlocProvider.of<AyaCubit>(context).player.stop();
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 26),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF8F8F8).withOpacity(0.8),
                      ),
                      child: BlocBuilder<AyaCubit, AyaState>(
                        builder: (context, state) {
                          return SingleChildScrollView(
                            controller:
                                context.read<AyaCubit>().scrollControllerAya,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (context
                                            .read<AyaCubit>()
                                            .playSound) {
                                          setState(() {
                                            context.read<AyaCubit>().playSound =
                                                false;
                                            context.read<AyaCubit>().pause();
                                          });
                                        } else {
                                          setState(() {
                                            context.read<AyaCubit>().playSound =
                                                true;
                                            context.read<AyaCubit>().play(
                                                context
                                                    .read<AyaCubit>()
                                                    .formateString(context
                                                        .read<AyaCubit>()
                                                        .indexofAya));
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                      icon: context.read<AyaCubit>().playSound
                                          ? const Icon(
                                              Icons
                                                  .pause_circle_filled_outlined,
                                              color: AppColor.kBlackColor,
                                              size: 28,
                                            )
                                          : const Icon(
                                              Icons.play_circle_filled_outlined,
                                              color: AppColor.kBlackColor,
                                              size: 28,
                                            ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'سورة ${widget.sura.nameAr}',
                                      style: AppStyle.interRegular25,
                                    ),
                                    const SizedBox(width: 40),
                                  ],
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
                                const SizedBox(height: 10),
                                context.read<AyaCubit>().playSound
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          snapshot.data!.length,
                                          (index) => Text(
                                            snapshot.data![index],
                                            key: keys[index],
                                            style: AppStyle.interRegular20
                                                .copyWith(
                                              backgroundColor: index ==
                                                          context
                                                                  .read<
                                                                      AyaCubit>()
                                                                  .indexofAya -
                                                              1 &&
                                                      context
                                                          .read<AyaCubit>()
                                                          .playSound
                                                  ? Colors.yellow[300]
                                                  : null,
                                            ),
                                            // textDirection:
                                            //     TextDirection.rtl,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      )
                                    : RichText(
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          children: List.generate(
                                            snapshot.data!.length,
                                            (index) => TextSpan(
                                              text: snapshot.data![index],
                                              style: AppStyle.interRegular20
                                                  .copyWith(
                                                backgroundColor: index ==
                                                            context
                                                                    .read<
                                                                        AyaCubit>()
                                                                    .indexofAya -
                                                                1 &&
                                                        context
                                                            .read<AyaCubit>()
                                                            .playSound
                                                    ? Colors.yellow[300]
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
      },
    );
  }

  Future<List<String>> getAyas(int count, int index) async {
    // log(count.toString());
    // log(index.toString());
    // log('assets/json/surah/surah_$index.json');
    // log('assets/json/surah/surah_1.json');
    String jsonData =
        await rootBundle.loadString('assets/json/surah/surah_$index.json');
    // log(jsonData);
    var myJsonDecode = json.decode(jsonData);

    List<String> arr = [];
    for (var i = 0; i < count; i++) {
      // log('Array');
      arr.add('${myJsonDecode['verse']['verse_${i + 1}']} (${i + 1}) ');
    }
    return arr;
  }
}
