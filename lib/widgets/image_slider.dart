import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviesplaylist/models/movie.dart';
import 'package:moviesplaylist/screens/movie_details_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  List<Movie> movies;

  ImageSlider({
    Key? key,
    required this.movies
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                reverse: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
                onPageChanged: (index , reason)=>
                    setState(() =>activeIndex = index),
              ),
              items: widget.movies.take(5).map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()=>{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(idMovie: e.id,)))
                      },
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500'+e.backdrop_path.toString(),
                          width: 1050,
                          height: 350,
                          fit: BoxFit.cover
                      ),
                    )
                  ],
                ) ,
              )).toList(),
            ),
            const Divider(
              height: 13,
              color: Colors.transparent,
            ),
            AnimatedSmoothIndicator(
              count: widget.movies.take(5).length,
              activeIndex: activeIndex,
              textDirection: TextDirection.rtl,
              effect: const SlideEffect(
                  dotColor: Colors.white,
                  dotWidth: 6,
                  dotHeight: 6,
                  activeDotColor: Color.fromRGBO(0, 43, 123, 100)
              ),
            ),
          ],
        )
    );
  }
}


