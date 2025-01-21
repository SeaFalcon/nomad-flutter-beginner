import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String startHour;
  final String startMinute;
  final String endHour;
  final String endMinute;
  final String title;
  final List<String> participants;
  final Color? color;

  const CustomCard({
    super.key,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.title,
    required this.participants,
    this.color = Colors.amberAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 180,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // 세로 배열 글씨
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  startHour,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  startMinute,
                  style: TextStyle(
                    fontSize: 10,
                    height: .9,
                  ),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  endHour,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  endMinute,
                  style: TextStyle(
                    fontSize: 10,
                    height: .9,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 48, fontWeight: FontWeight.w500, height: .9),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: participants.map(
                      (participant) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            participant,
                            style: TextStyle(
                              color: participant == 'ME'
                                  ? Colors.black
                                  : Color(0xff6a6a6a),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
