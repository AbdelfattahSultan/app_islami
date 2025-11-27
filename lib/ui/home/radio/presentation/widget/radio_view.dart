import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c16/ui/home/radio/presentation/cubit/radio_cubit.dart';
import 'package:islami_c16/ui/home/radio/presentation/cubit/radio_state.dart';
import 'package:islami_c16/ui/home/radio/presentation/widget/voice_card.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  final AudioPlayer _player = AudioPlayer();

  int? _playingIndex;
  bool _isPlaying = false;

  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    context.read<RadioCubit>().getRadio();
  }

  Future<void> _onPlay(int index, String url) async {
    if (_playingIndex == null) {
      await _player.stop();
      await _player.play(UrlSource(url));
      setState(() {
        _playingIndex = index;
        _isPlaying = true;
      });
    } else if (_playingIndex == index) {
      if (_isPlaying) {
        await _player.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _player.resume();
        setState(() {
          _isPlaying = true;
        });
      }
    } else {
      await _player.stop();
      await _player.play(UrlSource(url));
      setState(() {
        _playingIndex = index;
        _isPlaying = true;
      });
    }
  }

  Future<void> _onMute() async {
    if (_isMuted) {
      await _player.setVolume(1.0);
      setState(() {
        _isMuted = false;
      });
    } else {
      await _player.setVolume(0.0);
      setState(() {
        _isMuted = true;
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RadioErrorState) {
          return Center(child: Text(state.massage));
        } else if (state is RadioSuccessState) {
          final radios = state.radios;

          return ListView.builder(
            itemCount: radios.length,
            itemBuilder: (context, index) {
              final radio = radios[index];

              final bool isCardPlaying = _playingIndex == index && _isPlaying;

              return VoiceCard(
                name: radio.name ?? "",
                onPlay: () {
                  _onPlay(index, radio.url ?? "");
                },
                isPlaying: isCardPlaying,
                isMuted: _isMuted,
                onMute: _onMute,
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
