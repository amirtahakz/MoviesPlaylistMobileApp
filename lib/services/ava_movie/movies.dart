import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';


Future<void> getLinksMovie() async {
  const String url = 'https://avamovie1.xyz/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-the-matrix-resurrections-2021/';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var document = parse(response.body);
    var gg = document.getElementsByClassName('links-body')[0].children[1].children[0].children[1].children[0];
    print(gg.attributes.values.elementAt(1));
  }
  throw Exception('Something is wrong');
}


