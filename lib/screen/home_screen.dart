import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로멘스/판타지',
      'poster': 'crash_of_love.jpg',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로멘스/판타지',
      'poster': 'crash_of_love.jpg',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로멘스/판타지',
      'poster': 'crash_of_love.jpg',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로멘스/판타지',
      'poster': 'crash_of_love.jpg',
      'like': false,
    })
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            const TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/netflix.png',
            fit: BoxFit.contain,
            height: 25,
          ),
           const Padding(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
           const Padding(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
           const Padding(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
          
        ],
      ),
    );
  }
}
