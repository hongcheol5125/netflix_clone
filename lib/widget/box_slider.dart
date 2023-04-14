import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  // 홈화면에 받아야 하므로 final List<Movie> movies; 씀!
  final List<Movie> movies;
  const BoxSlider({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('지금 뜨는 콘텐츠'),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeBoxImages(context, movies),
          ),
        )
      ],
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for(var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: (){
          Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return DetailScreen(movie: movies[i]);
                          })
                      );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/' + movies[i].poster),
          ),
        ),
      )
    );
  }
  return results;
}