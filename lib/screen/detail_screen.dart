import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
// 배경에 블러처리된 사진 처리 하려면 필요!
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({required this.movie, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/${widget.movie.poster}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 45, 0, 10),
                              height: 300,
                              child:
                                  Image.asset('images/${widget.movie.poster}'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text(
                                '99% 일치 2019 15+ 시즌 1개',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                widget.movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.red,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text('재생'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(widget.movie.toString()),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '출연 : 현빈, 손예진, 서지혜\n제작자 : 이정호, 박지은',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // 위의 앱바 생성(생성된 x는 팝업 다이얼로그에 기본으로 적용되어 있으므로 따로 선언 안해도 된다.)
                Positioned(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )),
                makeMenuButton(),
              ],
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          like
                              ? const Icon(Icons.check)
                              : const Icon(Icons.add),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: [
                        Icon(Icons.thumb_up),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '평가',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white60,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: [
                        Icon(Icons.send),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '공유',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white60,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget makeMenuButton() {
  return Container();
}
