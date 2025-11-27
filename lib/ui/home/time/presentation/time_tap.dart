import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c16/ui/home/time/api/time_api.dart';
import 'package:islami_c16/ui/home/time/data/time_data_source_impl.dart';
import 'package:islami_c16/ui/home/time/presentation/cubit/time_cubit.dart';
import 'package:islami_c16/ui/home/time/presentation/cubit/time_state.dart';
import 'package:islami_c16/ui/home/time/presentation/widget/time_card.dart';

class TimeTap extends StatefulWidget {
  const TimeTap({super.key});

  @override
  State<TimeTap> createState() => _TimeTapState();
}

class _TimeTapState extends State<TimeTap> {
  late PageController _pageController;
  double currentPage = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.32,
      initialPage: currentPage.toInt(),
    );

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TimeCubit(TimeDataSourceImpl(TimeApi(Dio())))..getPrayerTimes(),
      child: BlocBuilder<TimeCubit, TimeState>(
        builder: (context, state) {
          if (state is TimeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TimeErrorState) {
            return Center(child: Text(state.massage));
          }

          if (state is TimeSuccessState) {
            final response = state.response;
            final timings = response.data.timings;
            final date = response.data.date;
            final hijri = date.hijri;
            final greg = date.gregorian;

            final String gregorianDate =
                "${greg.day} ${greg.monthEn}, ${greg.year}";
            final String hijriDate =
                "${hijri.day} ${hijri.monthAr}, ${hijri.year}";
            final String weekday = greg.weekday;

            final prayers = [
              {"name": "Fajr", "time": timings.fajr},
              {"name": "Sunrise", "time": timings.sunrise},
              {"name": "Dhuhr", "time": timings.dhuhr},
              {"name": "Asr", "time": timings.asr},
              {"name": "Maghrib", "time": timings.maghrib},
              {"name": "Isha", "time": timings.isha},
            ];

            return Center(
              child: Container(
                height: 301,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xff856B3F),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/curve_back.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  gregorianDate,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  weekday,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: const [
                              Text(
                                "Prayer Time",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Today",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  hijriDate,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                const Text(
                                  "Hijri",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 140,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: prayers.length,
                          itemBuilder: (context, index) {
                            final distance = (index - currentPage).abs();
                            double scale = 1 - (distance * 0.25);
                            if (scale < 0.8) scale = 0.8;
                            final bool isSelected = distance < 0.5;

                            return Transform.scale(
                              scale: scale,
                              child: TimeCard(
                                name: prayers[index]["name"]!,
                                time: prayers[index]["time"]!,
                                isSelected: isSelected,
                              ),
                            );
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.access_time,
                            color: Colors.white70,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Next Pray - 02:32",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
