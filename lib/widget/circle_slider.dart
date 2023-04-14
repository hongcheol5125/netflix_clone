import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  const CircleSlider({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
              // 좌우로 스크롤 가능!(vertical이 default값이다.)
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for(var i = 0; i< movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return DetailScreen(movie: movies[i]);
                          })
                      );
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/' + movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      )
    );
  }
  return results;
}