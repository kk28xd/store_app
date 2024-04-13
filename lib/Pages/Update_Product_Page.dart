import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/textField.dart';

import '../services/update_product_service.dart';
import '../widgets/Button.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});
  static bool inAsyncCall = false;
  static String id = 'Update';
  static TextEditingController textEditingController = TextEditingController();
  static TextEditingController textEditingController1 = TextEditingController();
  static TextEditingController textEditingController3 = TextEditingController();

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  @override
  Widget build(BuildContext context) {
    ProductModel Product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    String? Price;
    UpdateProduct.textEditingController.text = '';
    UpdateProduct.textEditingController1.text = '';
    UpdateProduct.textEditingController3.text = '';
    return ModalProgressHUD(
      inAsyncCall: UpdateProduct.inAsyncCall,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 10),
          child: Column(
            children: [
              txtField(
                label: 'Product Name',
                txt: UpdateProduct.textEditingController,
              ),
              const SizedBox(
                height: 10,
              ),
              txtField(
                  label: 'Product Description',
                  txt: UpdateProduct.textEditingController1),
              const SizedBox(
                height: 10,
              ),
              txtField(
                label: 'Product Price',
                onChanged: (val) {
                  Price = val;
                },
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              txtField(
                  label: 'Product Image',
                  txt: UpdateProduct.textEditingController3),
              const SizedBox(
                height: 30,
              ),
              Button(
                on: () async{
                  setState(() {
                    UpdateProduct.inAsyncCall = true;
                  });
                  try {
                    await Update(Product, Price);
                    showSnackBar(context,'Updated');
                  }
                  catch (e){
                    print(e.toString());
                  }
                  setState(() {
                    UpdateProduct.inAsyncCall = false;
                  });
                },
                label: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Update(ProductModel Product, String? Price) async {
    await UpdateProductService().updateProduct(
        id: Product.id,
        title: UpdateProduct.textEditingController.text == '' ? Product.title : UpdateProduct.textEditingController.text,
        price: Price ?? Product.price.toString(),
        description: UpdateProduct.textEditingController1.text == '' ? Product.description : UpdateProduct.textEditingController1.text,
        image: UpdateProduct.textEditingController3.text == '' ? Product.image : UpdateProduct.textEditingController3.text,
        category: Product.Category);
  }
  void showSnackBar(BuildContext context, String mess) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mess),
      behavior: SnackBarBehavior.floating,
      width: 300,
    ));
  }
}
