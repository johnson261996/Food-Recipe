

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/food_model.dart';
import '../util/constant.dart';

class FullDetail extends StatelessWidget {
  int index;
  var light_mode;
  FoodModel item_data;
  FullDetail({
    Key? key,
    required this.index,
    required this.light_mode,
    required this.item_data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeaf4fc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
        light_mode == 1 ? Colors.white70 : MyTheme.darkCreamColor,
        leading: IconButton(
          color: light_mode == 1 ? Colors.black : Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: light_mode == 1 ? Colors.white70 : MyTheme.darkCreamColor,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Text( item_data.meals![index].strMeal!,
                style: GoogleFonts.merriweather(
                    color: light_mode == 1 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 38)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(item_data.meals![index].strTags ?? 'Tag',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 280,
              width: 400,
              child: Row(
                children: [
                  Container(
                    height: 300,
                    width: 180,
                    child: Column(
                      children: [
                        Text("  Nutritions ",
                            style: GoogleFonts.merriweather(
                                color: light_mode == 1
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 31)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 170,
                          child: Card(
                            color: light_mode == 1
                                ? Colors.white
                                : MyTheme.darkBluishColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      item_data.meals![index].strMeasure1!,
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                  Text("Calories kcal",
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 170,
                          child: Card(
                            color: light_mode == 1
                                ? Colors.white
                                : MyTheme.darkBluishColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      item_data.meals![index].strMeasure5!,
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                  Text("Carbo g",
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 170,
                          child: Card(
                            color: light_mode == 1
                                ? Colors.white
                                : MyTheme.darkBluishColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      item_data.meals![index].strMeasure1!,
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                  Text("Protein g",
                                      style: TextStyle(
                                          color: light_mode == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 260,
                      width: 211,
                      child: Image(
                        fit: BoxFit.fill,
                        image:
                        NetworkImage(item_data.meals![index].strMealThumb!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text("  Ingredients",
                style: GoogleFonts.merriweather(
                    color: light_mode == 1 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 31)),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(item_data.meals![index].strIngredient1! +
                  "\n" +
                  item_data.meals![index].strIngredient2! +
                  item_data.meals![index].strIngredient1! +
                      "\n" +
                      item_data.meals![index].strIngredient3! +
                  item_data.meals![index].strIngredient5! +
                  "\n" +
                  item_data.meals![index].strIngredient6! ,
                  style: GoogleFonts.arvo(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            Center(
              child: FloatingActionButton.extended(
                splashColor: Colors.red[100],
                focusElevation: 10,
                elevation: 20,
                onPressed: () {
                  launchUrl( Uri.parse(item_data.meals![index].strYoutube!));
                },
                icon: Icon(Icons.play_circle,color: Colors.white,),
                label: Text("Watch Video",style: TextStyle(color: Colors.white),),
                backgroundColor:
                light_mode == 1 ? Colors.red : MyTheme.lightBluishColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("  Recipe preparation",
                style: GoogleFonts.merriweather(
                    color: light_mode == 1 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 31)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(item_data.meals![index].strInstructions!,
                  style: GoogleFonts.arvo(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
          ]),
        ),
      ),
    );
  }
}