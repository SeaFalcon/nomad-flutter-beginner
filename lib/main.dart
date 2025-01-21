import 'package:flutter/material.dart';
import 'package:toonflix/widgets/card.dart';
import 'package:toonflix/widgets/header.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xff181818),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'MONDAY 16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '•',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // 수평 스크롤
                          child: Row(
                            children: List.generate(15, (index) => index + 17)
                                .map((number) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Text(
                                  number.toString(),
                                  style: TextStyle(
                                    color: Color(0xff7d7d7d),
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // 카드 세로 배열 Column
                  Column(
                    children: [
                      // 카드 Container
                      CustomCard(
                        startHour: '11',
                        startMinute: '30',
                        endHour: '12',
                        endMinute: '20',
                        title: 'DESIGN MEETING',
                        participants: ['ALEX', 'HELENA', 'NANA'],
                        color: Colors.amberAccent[200],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomCard(
                        startHour: '12',
                        startMinute: '35',
                        endHour: '14',
                        endMinute: '10',
                        title: 'DAILY PROJECT',
                        participants: ['ME', 'RICHARD', 'CIRY', '+4'],
                        color: Colors.deepPurple[200],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomCard(
                        startHour: '15',
                        startMinute: '00',
                        endHour: '16',
                        endMinute: '30',
                        title: 'WEEKLY PLANNING',
                        participants: ['DEN', 'NANA', 'MARK'],
                        color: Colors.limeAccent[400],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       backgroundColor: Color(0xff181818),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: Container(
//           color: Color(0xff3d3d3d),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 80,
//                 color: Colors.teal,
//               ),
//               Container(
//                 color: Colors.greenAccent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       color: Colors.blue,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             'Hey, Selena',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 28,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Text(
//                             'Welcome back',
//                             style: TextStyle(
//                               color: Colors.white.withValues(alpha: 0.8),
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.limeAccent,
//                 height: 60,
//               ),
//               Text(
//                 'Total Balance',
//                 style: TextStyle(
//                     fontSize: 22, color: Colors.white.withValues(alpha: .8)),
//               ),
//               Container(
//                 color: Colors.limeAccent,
//                 height: 10,
//               ),
//               Text(
//                 '\$5 194 482',
//                 style: TextStyle(
//                     fontSize: 44,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white.withValues(alpha: .8)),
//               ),
//               Container(
//                 color: Colors.limeAccent,
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Button(
//                     text: 'Transfer',
//                     bgColor: Colors.amber,
//                   ),
//                   Button(
//                     text: 'Request',
//                     bgColor: Color(0xff1f2123),
//                     textColor: Colors.white,
//                   )
//                 ],
//               ),
//               Container(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     'Wallets',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'View All',
//                     style: TextStyle(
//                       color: Colors.white.withValues(alpha: 0.6),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xff1f2123),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(25),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Euro',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 32,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 '6 428',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 'EUR',
//                                 style: TextStyle(
//                                   color: Colors.white.withValues(alpha: .6),
//                                   fontSize: 18,
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
