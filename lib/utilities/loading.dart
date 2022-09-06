import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 8, 63, 100), Color.fromRGBO(0, 43, 123, 100)])
      ),
      child: Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
    );
  }
}
