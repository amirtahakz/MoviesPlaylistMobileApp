import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/serial.dart';
import 'package:moviesplaylist/services/tmdb/series.dart';
import 'package:moviesplaylist/widgets/serial_card.dart';

class SeriesGrid extends StatefulWidget {
  final List<Serial> items;

  const SeriesGrid({Key? key, required this.items}) : super(key: key);

  @override
  _SeriesGridState createState() => _SeriesGridState();
}

class _SeriesGridState extends State<SeriesGrid> {
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: (50 / 75),
            crossAxisSpacing: 3,
            mainAxisSpacing: 9,
          ),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: SerialCard(
                    id: widget.items[index].id,
                    poster_path: widget.items[index].poster_path,
                    title: widget.items[index].name,
                    Date: widget.items[index].first_air_date));
          }),
    );
  }

  getMoreData() async {
    currentPage += 1;
    var moreItems = getMorePopularSeries(currentPage);
    setState(() {
      moreItems.then((value) {
        widget.items.addAll(value);
      });
    });
  }
}
