import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_app_course_resto/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../helpers/product.dart';

class ProductProvider with ChangeNotifier{
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsSearched = [];
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  bool featured = false;
  File productImage;
  final picker = ImagePicker();
  String productImageFileName;




  ProductProvider.initialize(){
    loadProducts();
  }

  loadProducts()async{
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName})async{
    productsByCategory = await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }



  Future<bool> uploadProduct({String category, String restaurant, String restaurantId})async{
    try{
      String id = Uuid().v1();
      String imageUrl = await _uploadImageFile(imageFile: productImage, imageFileName: id);
      Map data = {
        "id": id,
        "name": name.text.trim(),
        "image": imageUrl,
        "rates": 0,
        "rating": 0.0,
        "price": double.parse(price.text.trim()),
        "restaurant": restaurant,
        "restaurantId": restaurantId,
        "description": description.text.trim(),
        "featured": featured
      };
      _productServices.createProduct(data:data);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }

  }

  changeFeatured(){
    featured = !featured;
    notifyListeners();
  }

//  method to load image files
  getImageFile({ImageSource source})async{
    final pickedFile = await picker.getImage(source: source, maxWidth: 640, maxHeight: 400);
    productImage = File(pickedFile.path);
    productImageFileName = productImage.path.substring(productImage.path.indexOf('/' ) + 1);
    notifyListeners();
  }
  
//  method to upload the file to firebase
  Future _uploadImageFile({File imageFile, String imageFileName})async{
    StorageReference reference = FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask uploadTask = reference.putFile(imageFile);
    String imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return imageUrl;
  }

  Future search({String productName})async{
    productsSearched = await _productServices.searchProducts(productName: productName);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");

    notifyListeners();
  }

  clear(){
    productImage = null;
    productImageFileName = null;
    name = null;
    description = null;
    price = null;
  }


}