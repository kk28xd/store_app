import 'dart:convert';
import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class GetCategory {
  Future<List<ProductModel>> getCategory({required String cat}) async {
    List data = await API().get(url: 'https://fakestoreapi.com/products/category/$cat');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
