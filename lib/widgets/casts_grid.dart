import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/cast.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'cast_card.dart';

class CastsGrid extends StatefulWidget {
  final List<Cast> items;

  const CastsGrid({Key? key, required this.items}) : super(key: key);

  @override
  _CastsGridState createState() => _CastsGridState();
}

class _CastsGridState extends State<CastsGrid> {
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
            maxCrossAxisExtent: 100,
            childAspectRatio: (50 / 60),
            crossAxisSpacing: 4,
            mainAxisSpacing: 12,
          ),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: CastCard(
                id: widget.items[index].id,
                name: widget.items[index].name,
                profile_path: widget.items[index].profile_path,
              ),
            );
          }),
    );
  }

  getMoreData() async {
    currentPage += 1;
    var moreItems = getMorePopularCasts(currentPage);
    setState(() {
      moreItems.then((value) {
        widget.items.addAll(value);
      });
    });
  }
}
