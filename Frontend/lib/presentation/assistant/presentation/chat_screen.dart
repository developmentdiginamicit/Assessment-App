import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  const ChatScreen({super.key, required this.title});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BubbleNormalImage(
                      id: 'id001',
                      image: _image(),
                      color: const Color(0xFF5E16DA),
                      tail: true,
                      delivered: true,
                    ),
                    const BubbleSpecialThree(
                      text: 'Hii',
                      color: Colors.white,
                      tail: true,
                      textStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    DateChip(
                      date: DateTime(now.year, now.month, now.day - 1),
                    ),
                    leftChatWidget(),
                    DateChip(
                      date: now,
                    ),
                    const BubbleSpecialThree(
                      text: 'Hlw how are you??',
                      color: Colors.white,
                      tail: true,
                      textStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    leftChatWidget(),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              MessageBar(
                messageBarColor: Colors.transparent,
                onSend: (_) => print(_),
                actions: const [],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget leftChatWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.logo, height: 30.h, width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BubbleSpecialThree(
              text: "Hlw how are you??",
              color: const Color(0xFF5E16DA),
              textStyle:
                  TextStyle(color: AppColors.whiteColor, fontSize: 15.sp),
              tail: true,
              isSender: false,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, top: 5.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  Icons.copy,
                  size: 15.sp,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.thumb_up,
                  size: 15.sp,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.thumb_down,
                  size: 15.sp,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.refresh,
                  size: 15.sp,
                  color: AppColors.whiteColor,
                )
              ]),
            )
          ],
        ),
      ],
    );
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://file-examples.com/storage/fef1706276640fa2f99a5a4/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
