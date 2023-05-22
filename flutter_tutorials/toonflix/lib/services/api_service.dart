import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode.model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const today = "today";

  static Future<List<WebToonModel>> getTodaysToons() async {
    List<WebToonModel> webtoons = [];
    final url = Uri.parse("$baseUrl/$today");
    final http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> lstWebToonModel = jsonDecode(res.body);

      for (var webtoon in lstWebToonModel) {
        final toon = WebToonModel.fromJson(webtoon);
        webtoons.add(toon);
        //print("${toon.title} ${toon.id} ${toon.thumb}");
      }
      return webtoons;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      final webWebtoonDetail = jsonDecode(res.body);
      final WebtoonDetailModel webToonDetail =
          WebtoonDetailModel.fromJson(webWebtoonDetail);
      print(
          "getToonById($id): ${webToonDetail.title} ${webToonDetail.about} ${webToonDetail.genre} ${webToonDetail.age}");
      return webToonDetail;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> lstEpisodeInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      final episodes = jsonDecode(res.body);

      for (var epi in episodes) {
        lstEpisodeInstances.add(WebtoonEpisodeModel.fromJson(epi));
      }

      return lstEpisodeInstances;
    }
    throw Error();
  }
}
