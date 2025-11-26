import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c16/ui/home/radio/api/radio_api.dart';
import 'package:islami_c16/ui/home/radio/data/radio_data_source_impl.dart';
import 'package:islami_c16/ui/home/radio/presentation/cubit/radio_cubit.dart';
import 'package:islami_c16/ui/home/radio/presentation/widget/radio_view.dart';
import 'package:islami_c16/ui/home/radio/presentation/widget/tap_Item.dart';

class RadioContent extends StatefulWidget {
  const RadioContent({super.key});

  @override
  State<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends State<RadioContent> {


  ValueNotifier<String> selectedTap = ValueNotifier("radio");
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit(RadioDataSourceImpl(RadioApi())),
      child: Scaffold(
        body: Column(
          children: [
            buildTapBar(),
            SizedBox(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: selectedTap,
                builder: (context, value, child) {
                  return value == "radio"
                      ? RadioView()
                      : Container(decoration: BoxDecoration(color: Colors.red));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTapBar() {
    return ValueListenableBuilder(
      valueListenable: selectedTap,
      builder: (context, value, child) {
        return Row(
          children: [
            TapItem(
              id: "radio",
              title: "Radio",
              selected: value,
              onTap: () {
                selectedTap.value = "radio";
              },
            ),

            TapItem(
              id: "reciters",
              title: "Reciters",
              selected: value,
              onTap: () {
                selectedTap.value = "reciters";
              },
            ),
          ],
        );
      },
    );
  }
}
