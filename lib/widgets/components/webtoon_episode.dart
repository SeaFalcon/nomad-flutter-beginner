import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  final WebtoonEpisodeDetailModel episode;
  final String webtoonId;

  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  onButtonTap() async {
    final url = Uri.parse(
      "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}",
    );
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[400],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(episode.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          )),
    );
  }
}
