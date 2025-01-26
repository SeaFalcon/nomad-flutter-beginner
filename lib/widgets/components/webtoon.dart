import 'package:flutter/material.dart';
import 'package:toonflix/widgets/components/webtoon_detail.dart';

class WebToon extends StatelessWidget {
  final String title, thumb, id;

  const WebToon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebtoonDetail(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              height: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: Offset(10, 10),
                      color: Colors.black.withValues(alpha: .3),
                    )
                  ]),
              child: Image.network(
                thumb,
                headers: {'Referer': 'https://comic.naver.com'},
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
