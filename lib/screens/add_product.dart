import 'package:flutter/material.dart';
import 'package:food_app_course_resto/helpers/style.dart';
import 'package:food_app_course_resto/widgets/custom_file_button.dart';
import 'package:food_app_course_resto/widgets/custom_text.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
//    final itemProvider = Provider.of<ItemsProvider>(context);
//    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: white,
          title: Text(
            "Add Product",
            style: TextStyle(color: black),
          )),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Stack(
                  children: <Widget>[
                    CustomFileUploadButton(
                      icon: Icons.image,
                      text: "Add image",
                      onTap: () async {
//                        itemProvider.loadCoverFile();
                      },
                    ),
//                    Visibility(
//                      visible: itemProvider.coverFile != null,
//                      child: Positioned(
//                        bottom: 20,
//                        right: 50,
//                        child: Align(
//                            alignment: Alignment.bottomCenter,
//                            child: CustomText(
//                              text: "${itemProvider.coverFileName} added",
//                              size: 10,
//                              color: green,
//                            )),
//                      ),
//                    )
                  ],
                ),

              ],
            ),
          ),
          Divider(),
          Padding(
              padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(text: "featured Magazine"),
                  Switch(
                      value: true,
                      onChanged: (value) {
                      })
                ],
              )),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomText(text: "Category:", color: grey, weight: FontWeight.w300,),
              DropdownButton<String>(
                value: 'Indian',
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w300
                ),
                icon: Icon(Icons.filter_list,
                  color: primary,),
                elevation: 0,
                onChanged: (value){
                },
                items: <String>["Indian", "Chinese", "Italian"].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value));
                }).toList(),

              ),
            ],
          ),
          Divider(),
          Padding(
            padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  controller: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Product name",
                      hintStyle: TextStyle(
                          color: grey, fontFamily: "Sen", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  controller: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Product description",
                      hintStyle: TextStyle(
                          color: grey, fontFamily: "Sen", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  controller: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Price",
                      hintStyle: TextStyle(
                          color: grey, fontFamily: "Sen", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
                decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(color: black, width: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.3),
                          offset: Offset(2, 7),
                          blurRadius: 4)
                    ]),
                child: FlatButton(
                  onPressed: () async{
//                    app.changeLoading();
//                    if(! await itemProvider.publishMagazine()){
//                      _key.currentState.showSnackBar(
//                          SnackBar(content: Text("Publication Failed"), duration: const Duration(seconds: 10),)
//                      );
//                      app.changeLoading();
//                      return;
//                    }else{
//                      itemProvider.clearAll();
//                      itemProvider.getItems();
//                      _key.currentState.showSnackBar(
//                          SnackBar(content: Text("Magazine published"), duration: const Duration(seconds: 10),)
//                      );
//                      app.changeLoading();
//                      return;
//                    }
                  },
                  child: CustomText(
                    text: "Publish Magazine",
                    color: white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
