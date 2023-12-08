import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/features/home/bloc/home_bloc.dart';
import 'package:bloc_e_commerce/features/wishlist/ui/wishlist.dart';
import 'package:bloc_e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../cart/ui/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home UI
/**
 * Should listen to the states emitted by bloc and also accept events done/passed by the user
 *
 * So must me wrapped by bloc consumer
 */

class _HomePageState extends State<HomePage> {
  final HomeBloc homebloc = HomeBloc();


  @override
  void initState() {
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight =  MediaQuery.of(context).size.height;
    double screenWidth =  MediaQuery.of(context).size.width;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionsState,
      //listen when action
      //listen to click events
      buildWhen: (previous, current) => current is! HomeActionsState,
      //build when no action
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          //checks the data type of the obj
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          //checks the data type of the obj
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFF1EBEB),
              appBar: AppBar(
                backgroundColor: Color(0xFFF1EBEB),
                title: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 25,
                            ),
                            onPressed: () {
                              homebloc.add(HomeCartButtonNavigateEvent());
                            },
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_location_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Tokyo",
                                style: TextStyle(
                                    fontSize: 24, fontFamily: "LibreFranklin"),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 25,
                            ),
                            onPressed: () {
                              homebloc.add(HomeWishlistButtonNavigateEvent());
                            },
                          )
                        ]),
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /**
                   * Banner
                   */
                  Padding(
                    padding: const EdgeInsets.only(left: 26,right: 26,top: 12),
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFB1454A),
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the border radius here
                          ),
                          height: screenHeight * 0.19,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        "Get 32% Promo",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlayfairDisplay"),
                                      )),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStatePropertyAll(0),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white38)),
                                      onPressed: () {},
                                      child: Text(
                                        "Buy Food",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontFamily: "LibreFranklin"),
                                      ))
                                ],
                              ),
                              Container(
                                  child: LottieBuilder.asset(
                                "assets/sushi-offer.json",
                                height: 200,
                                width: 130,
                              ))
                            ],
                          )),
                    ),
                  ),
                  /**
                   * Search
                   */
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal:26.0),
                    child: SearchBar(
                      textStyle: MaterialStatePropertyAll(TextStyle(
                        fontSize: 17,
                        fontFamily: "LibreFranklin",
                      )),
                      elevation: MaterialStatePropertyAll(0),
                      shadowColor: MaterialStatePropertyAll(Colors.red),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFF9F9F9)),
                      hintText: "Search",
                      leading: Icon(Icons.search),
                    ),
                  ),
                  /**
                   * Menu Small
                   */
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/yellow-sushi.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "Sushi",
                                      style: TextStyle(
                                          fontFamily: "LibreFranklin",
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Menu items
                  /**
                   * Menu big
                   */
                  SingleChildScrollView (
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            //padding of entire card
                            child: Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/sushi.png",
                                          height: 110,
                                          width: 115,
                                        ),
                                        Icon(
                                          Icons.favorite_border_sharp,
                                          size: 30,
                                          color: Color(0x56111111),
                                        )
                                      ],
                                    ),
                                    AutoSizeText(
                                      "Original Sushi",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: screenHeight * 0.018,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$21.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "LibreFranklin",
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffe18414),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            //padding of entire card
                            child: Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/sushi.png",
                                          height: 110,
                                          width: 115,
                                        ),
                                        Icon(
                                          Icons.favorite_border_sharp,
                                          size: 30,
                                          color: Color(0x56111111),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Original Sushi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$21.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "LibreFranklin",
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffe18414),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            //padding of entire card
                            child: Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/sushi.png",
                                          height: 110,
                                          width: 115,
                                        ),
                                        Icon(
                                          Icons.favorite_border_sharp,
                                          size: 30,
                                          color: Color(0x56111111),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Original Sushi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$21.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "LibreFranklin",
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffe18414),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            //padding of entire card
                            child: Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/sushi.png",
                                          height: 110,
                                          width: 115,
                                        ),
                                        Icon(
                                          Icons.favorite_border_sharp,
                                          size: 30,
                                          color: Color(0x56111111),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Original Sushi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$21.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "LibreFranklin",
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffe18414),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            //padding of entire card
                            child: Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F9F9),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/sushi.png",
                                          height: 110,
                                          width: 115,
                                        ),
                                        Icon(
                                          Icons.favorite_border_sharp,
                                          size: 30,
                                          color: Color(0x56111111),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Original Sushi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$21.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "LibreFranklin",
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffe18414),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  /**
                   * Title Popular foods
                   */
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Popular Food",style: TextStyle(fontSize: 18,fontFamily: "LibreFranklin"),)),
                  ),
                  /**
                   * Egg
                   */
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: screenWidth * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal:10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center ,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Image.asset(
                                "assets/egg.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const Flexible(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 13),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Salmon Eggs",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PlayfairDisplay",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$21.00",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "LibreFranklin",
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFFFA600),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "5.0",
                                              style: TextStyle(
                                                  color: Color(0x56111111),
                                                  fontSize: 14,
                                                  fontFamily: "LibreFranklin",
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: Icon(Icons.favorite_border,
                                    size: 32, color: Color(0x56111111)))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return Scaffold();
        }
      },
    );
  }
}
