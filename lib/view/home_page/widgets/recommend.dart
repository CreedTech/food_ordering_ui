import 'package:flutter/material.dart';
import 'package:food_order_ui/models/food.dart';
import 'package:food_order_ui/models/food_list.dart';
import '../../styles/size_config.dart';

class RecommendFoods extends StatefulWidget {
  const RecommendFoods({Key? key}) : super(key: key);

  @override
  _RecommendFoodsState createState() => _RecommendFoodsState();
}

class _RecommendFoodsState extends State<RecommendFoods> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: bringTheFoods(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var foodList = snapshot.data;
          return SizedBox(
            height: SizeConfig.screenHeight! / 2.58, //265
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodList!.length,
              itemBuilder: (context, index) {
                var food = foodList[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          SizeConfig.screenWidth! / 34.25, // 12.0
                          SizeConfig.screenHeight! / 170.75, // 4.0
                          SizeConfig.screenWidth! / 41.1, // 10.0
                          SizeConfig.screenHeight! / 170.75, // 4.0
                        ),
                        height: SizeConfig.screenHeight! / 2.73, // 250.0
                        width: SizeConfig.screenWidth! / 2.055, // 200.0
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(4, 6),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.3),
                              )
                            ]),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(food.foodImageName),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Positioned(
                              left: SizeConfig.screenWidth! / 34.25, // 12.0
                              bottom: SizeConfig.screenHeight! / 45.54, // 15.0
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(food.foodName,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenHeight! / 34.15,
                                          color: Colors.white)), // 20
                                  Text(food.foodCategory,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenHeight! / 48.79,
                                          color: Colors.white)), // 14
                                  Text("\$${food.foodPrice}",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenHeight! / 37.95,
                                          color: Colors.white)) // 18
                                ],
                              ),
                            ),
                            Positioned(
                              top: SizeConfig.screenHeight! / 68.3, // 10.0
                              right: SizeConfig.screenWidth! / 41.1, // 10.0
                              child: const Icon(Icons.favorite,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
