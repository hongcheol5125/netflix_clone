import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  const CarouselImage({super.key, required this.movies});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset('./images/' + e.poster)).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              height: 200.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                  _currentKeyword = keywords[currentPage];
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  likes[currentPage]
                      ? IconButton(onPressed: () {}, icon: Icon(Icons.check))
                      : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  const Text(
                    '내가 찜한 콘텐츠',
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        '재생',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return DetailScreen(movie: movies[currentPage]);
                          })
                      );
                    }, icon: const Icon(Icons.info)),
                    const Text(
                      '정보',
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes, currentPage),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == i
            ? const Color.fromRGBO(255, 255, 255, 0.9)
            : const Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }
  return results;
}
