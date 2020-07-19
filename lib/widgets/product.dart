import 'package:flutter/material.dart';
import 'package:food_app_course_resto/helpers/style.dart';
import 'package:food_app_course_resto/models/product.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final restaurantProvider = Provider.of<RestaurantProvider>(context);
//    final productProvider = Provider.of<ProductProvider>(context);


    return  Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]
        ),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.network(product.image, fit: BoxFit.fill,),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: product.name,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      children: <Widget>[
                        CustomText(text: "from: ", color: grey, weight: FontWeight.w300, size: 14,),
                        SizedBox(width: 10,),
                        GestureDetector(
                            onTap: ()async{
//                              await productProvider.loadProductsByRestaurant(
//                                  restaurantId: product.restaurantId);
//                              await restaurantProvider.loadSingleRestaurant(retaurantId: product.restaurantId);
//                              changeScreen(context, RestaurantScreen(restaurantModel: restaurantProvider.restaurant,));
                            },
                            child: CustomText(text: product.restaurant, color: primary, weight: FontWeight.w300, size: 14,)),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.star,
                              color: red,
                              size: 20,
                            ),
                          ),

                          SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomText(
                              text: product.rating.toString(),
                              color: grey,
                              size: 14.0,
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: CustomText(text: "\$${ product.price / 100}",weight: FontWeight.bold,),
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
