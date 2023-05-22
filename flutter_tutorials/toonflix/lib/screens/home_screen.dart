import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

//class HomeScreen extends StatefulWidget {
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysToons();

  // List<WebToonModel> webtoons = [];
  @override
  Widget build(BuildContext context) {
    print(webtoons);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "Today's 툰s",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),

      // Builder is rendering UI function
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // 01_ Original ListView
            // return ListView(
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );

            // 02_ListView.Builder: itemBuilder를 통해 필요한 부분만 로드한다.
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     print("index: $index");
            //     var webtoon = snapshot.data![index];
            //     return Text(webtoon.title);
            //   },
            // );

            // 03_ListView.separated: item들 사이에 separator를 넣어줄수 있다.
            //return makeItemList(snapshot);

            // 04 Column
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeItemList(snapshot),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeItemList(AsyncSnapshot<List<WebToonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        print("data's thumb: ${webtoon.thumb}");
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
