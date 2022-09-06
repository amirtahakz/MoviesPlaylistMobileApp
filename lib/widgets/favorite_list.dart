import 'package:flutter/material.dart';
import 'package:moviesplaylist/widgets/favorite_card.dart';


class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteList createState() => _FavoriteList();
}

class _FavoriteList extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 100,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const FavoriteCard();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const VerticalDivider(
          width: 0,
        );
      },
    );
  }
}
