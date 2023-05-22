import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode.model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;

  // state
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');

    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }

    print("initPrefs $isLiked");
  }

  onPressedFavorit() async {
    final likedToons = prefs.getStringList("likedToons");

    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList("likedToons", likedToons);

      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);

    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    //Future<WebtoonDetailModel> webtoon = ApiService.getToonById(widget.id);

    print("build: (id=${widget.id} state=$isLiked");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: onPressedFavorit,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
            ),
          ),
        ],
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id, // this widget (go to parent: DetailScreen)
                    child: Container(
                      width: 170,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 15,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${snapshot.data!.genre} - ${snapshot.data!.age}",
                        )
                      ],
                    );
                  }
                  return const RefreshProgressIndicator();
                },
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          WebtoonEpisode(episode: episode, webtoonId: widget.id)
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
