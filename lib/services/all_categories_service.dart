import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List> getAllCategoriesService() async {
      List data = await API().get(url: 'https://fakestoreapi.com/products/categories');
      return data;
  }
}
