import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebToonModel>> getTodaysToons() async {
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
}
