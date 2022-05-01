import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:revivefrr/pages_slider/books.dart';
import 'list.dart';

class Romans extends StatefulWidget {
  const Romans({Key? key}) : super(key: key);

  @override
  _RomansState createState() => _RomansState();
}

class _RomansState extends State<Romans> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      // scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            // height: 600,
            width: 170,
            // color: Colors.red,
            child: GestureDetector(
              onTap: (){
                // Navigator.of(context).pop(const ProductInfo());
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductInfo()));
              },
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CarouselSlider.builder(
                      options: CarouselOptions(
                          autoPlay: true,
                          height: 580,
                          enlargeCenterPage: true,
                          aspectRatio: 16/9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                      ),
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, index, realIdx) {
                        return Stack(
                            children:[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child:  Image(image:AssetImage(images[index]),fit: BoxFit.cover,height: 500,)
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 435.0),
                                child: Center(
                                  child: SizedBox(
                                    // bottom: -30,
                                    // left: 66,
                                    child: Container(
                                      height: 100,
                                      width: 260,
                                      decoration:  BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 12.0,
                                                offset: Offset(3, 2)
                                            ),
                                          ]
                                      ),
                                      // Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Text(products[index],
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                                                fontSize: 22, letterSpacing: 0.5),),
                                          Text(prices[index],style: const TextStyle(color: Colors.red, fontSize: 20)),

                                        ],
                                      ),

                                      // child: const Padding(
                                      //   padding: EdgeInsets.all(22.0),
                                      //   child: Text('Product Name',
                                      //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                                      //   fontSize: 22, letterSpacing: 0.5),),
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        );
                      },
                      // items: [
                      //   Stack(
                      //     children:[
                      //       ClipRRect(
                      //         borderRadius: BorderRadius.circular(30),
                      //           child: const Image(image:AssetImage('assets/game.jpg'),fit: BoxFit.cover,height: 500,)
                      //     ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 435.0),
                      //         child: Center(
                      //           child: Expanded(
                      //             // bottom: -30,
                      //             // left: 66,
                      //             child: Container(
                      //               height: 100,
                      //               width: 260,
                      //               decoration:  BoxDecoration(
                      //                   color:Colors.white,
                      //                   borderRadius: BorderRadius.circular(30),
                      //                   boxShadow: const [
                      //                     BoxShadow(
                      //                         color: Colors.grey,
                      //                         blurRadius: 12.0,
                      //                         offset: Offset(3, 2)
                      //                     ),
                      //                   ]
                      //               ),
                      //               // Container(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(24),
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   // mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: const [
                      //                     Text('Product Name',
                      //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //                           fontSize: 22, letterSpacing: 0.5),),
                      //                     Text("\$25,00",style: TextStyle(color: Colors.red, fontSize: 20)),
                      //                   ],
                      //                 ),
                      //               ),
                      //
                      //               // child: const Padding(
                      //               //   padding: EdgeInsets.all(22.0),
                      //               //   child: Text('Product Name',
                      //               //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //               //   fontSize: 22, letterSpacing: 0.5),),
                      //               // ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ]
                      //   ),
                      //   Stack(
                      //       children:[
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(30),
                      //             child: const Image(image:AssetImage('assets/love.jpg'),fit: BoxFit.cover,height: 500,)
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 435.0),
                      //           child: Center(
                      //             child: Expanded(
                      //               // bottom: -30,
                      //               // left: 66,
                      //               child: Container(
                      //                 height: 100,
                      //                 width: 260,
                      //                 decoration:  BoxDecoration(
                      //                     color:Colors.white,
                      //                     borderRadius: BorderRadius.circular(30),
                      //                     boxShadow: const [
                      //                       BoxShadow(
                      //                           color: Colors.grey,
                      //                           blurRadius: 12.0,
                      //                           offset: Offset(3, 2)
                      //                       ),
                      //                     ]
                      //                 ),
                      //                 // Container(
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.all(24),
                      //                   child: Column(
                      //                     crossAxisAlignment: CrossAxisAlignment.start,
                      //                     // mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: const [
                      //                       Text('Product Name',
                      //                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //                             fontSize: 22, letterSpacing: 0.5),),
                      //                       Text("\$25,00",style: TextStyle(color: Colors.red, fontSize: 20)),
                      //                     ],
                      //                   ),
                      //                 ),
                      //
                      //                 // child: const Padding(
                      //                 //   padding: EdgeInsets.all(22.0),
                      //                 //   child: Text('Product Name',
                      //                 //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //                 //   fontSize: 22, letterSpacing: 0.5),),
                      //                 // ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ]
                      //   ),
                      //   Stack(
                      //       children:[
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(30),
                      //             child: const Image(image:AssetImage('assets/aimer.jpg'),fit: BoxFit.cover,height: 500,)
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 435.0),
                      //           child: Center(
                      //             child: Expanded(
                      //               // bottom: -30,
                      //               // left: 66,
                      //               child: Container(
                      //                 height: 100,
                      //                 width: 260,
                      //                 decoration:  BoxDecoration(
                      //                     color:Colors.white,
                      //                     borderRadius: BorderRadius.circular(30),
                      //                     boxShadow: const [
                      //                       BoxShadow(
                      //                           color: Colors.grey,
                      //                           blurRadius: 12.0,
                      //                           offset: Offset(3, 2)
                      //                       ),
                      //                     ]
                      //                 ),
                      //                 // Container(
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.all(24),
                      //                   child: Column(
                      //                     crossAxisAlignment: CrossAxisAlignment.start,
                      //                     // mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: const [
                      //                       Text('Product Name',
                      //                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //                             fontSize: 22, letterSpacing: 0.5),),
                      //                       Text("\$25,00",style: TextStyle(color: Colors.red, fontSize: 20)),
                      //                     ],
                      //                   ),
                      //                 ),
                      //
                      //                 // child: const Padding(
                      //                 //   padding: EdgeInsets.all(22.0),
                      //                 //   child: Text('Product Name',
                      //                 //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                      //                 //   fontSize: 22, letterSpacing: 0.5),),
                      //                 // ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ]
                      //   ),
                      //
                      //
                      // ],
                  ),

                  // const SizedBox(height: 4,),
                  // Text(products[index],style: const TextStyle(fontSize:18, /*fontWeight: FontWeight.bold*/ ),),
                  // Text(prices[index],style:  const TextStyle(fontSize:17, color: Colors.red ),)
                ],
              ),
            ),
          ),
        );

      },
    );
    // return ListView(
    //   children: [
    //     const SizedBox(height: 15.0,),
    //     CarouselSlider(
    //         options: CarouselOptions(
    //           autoPlay: true,
    //           height: 800,
    //           enlargeCenterPage: true,
    //           aspectRatio: 16/9,
    //           autoPlayCurve: Curves.fastOutSlowIn,
    //           enableInfiniteScroll: true,
    //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //           viewportFraction: 0.8,
    //         ),
    //         items: [
    //           Stack(
    //             children:[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children:  [
    //                   Padding(
    //                     padding: const EdgeInsets.all(18.0),
    //                     child: ClipRRect(
    //                       child: const Card(
    //                         elevation: 4.0,
    //                         child: Image(image: AssetImage(images[index]),height: 500,fit: BoxFit.cover,),
    //                       ),
    //                       borderRadius: BorderRadius.circular(30),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Positioned(
    //                 // bottom: -20,
    //                 // left: 66,
    //                 child: Container(
    //                   height: 100,
    //                   width: 260,
    //                   decoration:  BoxDecoration(
    //                       color:Colors.white,
    //                       borderRadius: BorderRadius.circular(30),
    //                       boxShadow: const [
    //                         BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 12.0,
    //                             offset: Offset(3, 2)
    //                         ),
    //                       ]
    //                   ),
    //                   // Container(
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(24),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       // mainAxisAlignment: MainAxisAlignment.center,
    //                       children: const [
    //                         Text('Product Name',
    //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
    //                               fontSize: 22, letterSpacing: 0.5),),
    //                         Text("\$25,00",style: TextStyle(color: Colors.red, fontSize: 20)),
    //                       ],
    //                     ),
    //                   ),
    //
    //                   // child: const Padding(
    //                   //   padding: EdgeInsets.all(22.0),
    //                   //   child: Text('Product Name',
    //                   //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
    //                   //   fontSize: 22, letterSpacing: 0.5),),
    //                   // ),
    //                 ),
    //               ),
    //               // Positioned(
    //               //   bottom: -20,
    //               //   right:68,
    //               //   child: Container(
    //               //     decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(30)),
    //               //     child: Column(
    //               //       children: [
    //               //         IconButton(
    //               //           onPressed: () {
    //               //             setState(() {
    //               //               _iconColor == Colors.white60 ?
    //               //               _iconColor = Colors.red :
    //               //               _iconColor = Colors.white60;
    //               //
    //               //             });
    //               //           },
    //               //           icon: const Icon(Icons.favorite),
    //               //           color: _iconColor,
    //               //         )],
    //               //     ),
    //               //   ),
    //               // ),
    //
    //
    //             ],
    //             clipBehavior: Clip.none,
    //
    //           ),
    //         ],
    //
    //     )
    //   ],
    // );
  }
}
