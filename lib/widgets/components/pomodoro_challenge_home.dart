import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroChallengeHome extends StatefulWidget {
  const PomodoroChallengeHome({
    super.key,
  });

  @override
  State<PomodoroChallengeHome> createState() => _PomodoroChallengeHomeState();
}

class _PomodoroChallengeHomeState extends State<PomodoroChallengeHome> {
  static List<int> pomoTimers = [15, 20, 25, 30, 35];
  int selectedIndex = 2; // 초기 선택된 값 (25)

  int totalSeconds = 3; //pomoTimers[2] * 60;
  int restTime = 5 * 60;
  bool isRunning = false;
  bool isRest = false;
  int totalPomodoros = 0;
  int maxRound = 4;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      if (maxRound > totalPomodoros && !isRest) {
        setState(() {
          totalPomodoros += 1;
          totalSeconds = restTime;
          isRest = true;
        });
      } else if (isRest) {
        setState(() {
          isRunning = false;
          isRest = false;
          totalSeconds = pomoTimers[selectedIndex] * 60;
          timer.cancel();
        });
      } else if (maxRound == totalPomodoros) {
        setState(() {
          isRunning = false;
          totalSeconds = pomoTimers[selectedIndex] * 60;
          timer.cancel();
        });
      }
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var [hour, min, sec] = duration.toString().split('.').first.split(':');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'POMOTIMER ${isRest ? '(REST Time)' : ''}',
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Flexible(
          //   flex: 1,
          //   child: Row(
          //     children: [
          //       ...pomoTimers.map((timer) {
          //         return OutlinedButton(
          //           onPressed: () {},
          //           style: OutlinedButton.styleFrom(
          //             side: BorderSide(
          //               color: Theme.of(context).cardColor,
          //               width: 2,
          //             ), // 테두리 색상 및 두께
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(5), // 원하는 Radius 설정
          //             ),
          //           ),
          //           child: Text(
          //             '$timer',
          //             style: TextStyle(
          //               color: Theme.of(context).cardColor,
          //             ),
          //           ),
          //         );
          //       })
          //     ],
          //   ),
          // ),
          // Flexible(
          //   flex: 1,
          //   child: ListWheelScrollView(
          //     itemExtent: 50, // 각 아이템 높이
          //     diameterRatio: 2, // 다이얼 크기 조절
          //     physics: FixedExtentScrollPhysics(), // 자연스러운 스크롤
          //     children: [
          //       ...pomoTimers.map((timer) {
          //         return OutlinedButton(
          //           onPressed: () {},
          //           style: OutlinedButton.styleFrom(
          //             side: BorderSide(
          //               color: Theme.of(context).cardColor,
          //               width: 2,
          //             ), // 테두리 색상 및 두께
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(5), // 원하는 Radius 설정
          //             ),
          //           ),
          //           child: Text(
          //             '$timer',
          //             style: TextStyle(
          //               color: Theme.of(context).cardColor,
          //             ),
          //           ),
          //         );
          //       })
          //     ],
          //   ),
          // ),
          // Flexible(
          //     flex: 1,
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: List.generate(
          //           10,
          //           (index) => Container(
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             width: 80,
          //             height: 80,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: Colors.orangeAccent,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: Text(
          //               '${index + 1}',
          //               style: TextStyle(fontSize: 24, color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ),
          //     )),
          Flexible(
            flex: 1,
            // height: 60,
            child: PageView.builder(
              itemCount: pomoTimers.length,
              controller: PageController(
                initialPage: selectedIndex,
                viewportFraction: 0.3, // 아이템 크기 비율 조정
              ),
              onPageChanged: (index) {
                setState(() {
                  isRunning = false;
                  isRest = false;
                  totalSeconds = pomoTimers[index] * 60;
                  timer.cancel();
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Transform.scale(
                    scale: 1, // 선택된 숫자는 확대
                    child: Opacity(
                      opacity: isSelected ? 1.0 : 0.5, // 선택되지 않은 숫자는 투명도 조절
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          side: BorderSide(
                            color: isSelected
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).cardColor,
                            width: 2,
                          ), // 테두리 색상 및 두께
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // 원하는 Radius 설정
                          ),
                        ),
                        child: Text(
                          '${pomoTimers[index]}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: () =>
                    isRunning ? onPausePressed() : onStartPressed(),
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outlined),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '$totalPomodoros/$maxRound',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).cardColor.withValues(alpha: .5),
                        ),
                      ),
                      Text(
                        'ROUND',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '0/12',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).cardColor.withValues(alpha: .5),
                        ),
                      ),
                      Text(
                        'GOAL',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      )),
    );
  }
}
