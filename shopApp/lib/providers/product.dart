import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopApp/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toogleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;

    notifyListeners();
    final url =
        'https://flutterhttprequests-default-rtdb.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        throw HttpException('An error occured while changing favorite status.');
      }
    } catch (e) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
