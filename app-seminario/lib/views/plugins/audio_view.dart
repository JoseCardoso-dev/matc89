// ignore_for_file: deprecated_member_use

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class AudioView extends StatefulWidget {
  const AudioView({super.key});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;

  final _playList = ConcatenatingAudioSource(children: [
    AudioSource.asset(
      'assets/sons/som-teste.mp3',
      tag: MediaItem(
        id: '0',
        title: 'Capítulo 1',
        artist: 'Jogos Vorazes: A Esperança',
        artUri: Uri.parse(
          'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/87/35/87/20039778.jpg',
        ),
      ),
    ),
    AudioSource.asset(
      'assets/sons/danca-das-gatinhas.mp3',
      tag: MediaItem(
        id: '1',
        title: 'Capítulo 2',
        artist: 'Jogos Vorazes: A bonita coisa',
        artUri: Uri.parse(
          'https://images.suamusica.com.br/tuQs4G4aDtT5EJqTWVncc7G_icM=/240x240/filters:format(webp)/373377/4383887/cd_cover.jpeg',
        ),
      ),
    ),
    AudioSource.asset(
      'assets/sons/amor-e-fe.mp3',
      tag: MediaItem(
        id: '2',
        title: 'Capítulo 3',
        artist: 'Jogos Vorazes: Tudo aquilo lá',
        artUri: Uri.parse(
          'https://images.suamusica.com.br/3fpcgR6dejbT3ndOPvW6PQdAuZA=/240x240/filters:format(webp)/59328239/4438598/cd_cover.jpeg',
        ),
      ),
    ),
  ]);

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position: position,
          bufferedPosition: bufferedPosition,
          duration: duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playList);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1D1D1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 18,
                            color: Colors.white,
                          ),
                          const Text(
                            "Just Audio",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Você está ouvindo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          color: const Color(0xFF000000).withOpacity(0.16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<SequenceState?>(
                    stream: _audioPlayer.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      if (state?.sequence.isEmpty ?? true) {
                        return const SizedBox();
                      }
                      final metadata = state!.currentSource!.tag as MediaItem;
                      return MediaMetaData(
                        title: metadata.title,
                        artist: metadata.artist ?? '',
                        imageUrl: metadata.artUri.toString(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 30,
                      right: 30,
                    ),
                    child: StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return ProgressBar(
                          timeLabelTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          barHeight: 4,
                          bufferedBarColor: Colors.grey[300],
                          baseBarColor: Colors.white,
                          progressBarColor: Colors.black,
                          thumbColor: Colors.black,
                          progress: positionData?.position ?? Duration.zero,
                          buffered:
                              positionData?.bufferedPosition ?? Duration.zero,
                          total: positionData?.duration ?? Duration.zero,
                          onSeek: _audioPlayer.seek,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: _audioPlayer.seekToPrevious,
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 38,
                        color: Colors.black,
                      ),
                      Controls(audioPlayer: _audioPlayer),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: _audioPlayer.seekToNext,
                        icon: const Icon(Icons.skip_next),
                        iconSize: 38,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MediaMetaData extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;

  const MediaMetaData({
    super.key,
    required this.title,
    required this.artist,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          artist,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData({
    required this.position,
    required this.bufferedPosition,
    required this.duration,
  });
}

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const Controls({
    super.key,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }

        final playerState = snapshot.data as PlayerState;
        final processingState = playerState.processingState;
        final playing = playerState.playing;

        if (!(playing)) {
          return IconButton(
            onPressed: audioPlayer.play,
            iconSize: 85,
            color: Colors.white,
            icon: const Icon(Icons.play_circle_filled_rounded),
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            iconSize: 85,
            color: Colors.white,
            icon: const Icon(Icons.pause_circle_filled_rounded),
          );
        }
        return IconButton(
          onPressed: audioPlayer.play,
          iconSize: 85,
          color: Colors.white,
          icon: const Icon(
            Icons.play_circle_filled_rounded,
          ),
        );
      },
    );
  }
}
