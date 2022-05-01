// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revivefrr/pages_slider/romans.dart';
import 'package:url_launcher/url_launcher.dart';
import 'list.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}


class _ProductInfoState extends State<ProductInfo> {
  static const String _url = "https://agency.jouham.com";
  void _launchURL() async => await canLaunch(_url) ? await launch(_url, forceSafariVC: true,forceWebView: true,enableJavaScript: true,) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/book.jpg',width: MediaQuery.of(context).size.width,
                height: 350,fit:BoxFit.cover),
                Positioned(
                  top: 325,
                    left: 0,
                    child:Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        ),
                      ),
                    )

                ),
                 Positioned(
                    top: 35,
                    left: 10,
                    child:  IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Romans()));},)
                ),

              ],
            ),
            Column(
              children: [
                const Center(child:  Icon(Icons.arrow_drop_down_rounded)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text('Product Name', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 0.6),),
                        const Text('25,99\$', style: TextStyle(fontSize: 20, color: Colors.red),),
                        const SizedBox(height: 20,),
                        const Text('Amine Youssra Abdelatif Mossaab, ont formé une équipe pour un grand projet fin '
                            'd\'études où ils feront une application qui ce situe dans l\'envirenement des librairies '
                            'je crois que ouais cv toi? ', textAlign: TextAlign.justify,),
                        ElevatedButton(
                            onPressed: () {
                              _launchURL();
                            },
                            child: Text('lien'),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 170,
                                  // color: Colors.red,
                                  child: GestureDetector(
                                    onTap: (){
                                      // après mets des pages dans une liste et ajoute-les ici
                                    },
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(30),
                                            child:  Image(image:AssetImage(images[index]),fit: BoxFit.cover)
                                        ),
                                        const SizedBox(height: 4,),
                                        Text(products[index],style: const TextStyle(fontSize:18, /*fontWeight: FontWeight.bold*/ ),),
                                        Text(prices[index],style:  const TextStyle(fontSize:17, color: Colors.red ),)
                                      ],
                                    ),
                                  ),
                                ),
                              );

                            },
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //         pinned: true,
    //         shape:const ContinuousRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(90), bottomRight: Radius.circular(90))),
    //         // snap: _snap,
    //         // floating: _floating,
    //         expandedHeight: 300,
    //         flexibleSpace: FlexibleSpaceBar(
    //           title: const Text('Product Info', style: TextStyle(color: Colors.brown),),
    //           background: ClipRRect(
    //               borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
    //               child: Image.asset('assets/book.jpg', fit: BoxFit.fill)),
    //     ),
    //   ),
    //       const SliverFillRemaining(
    //         hasScrollBody: true,
    //
    //         child: Padding(
    //           padding: EdgeInsets.all(20.0),
    //           child: Text('Hello!'),
    //         ),
    //
    //       ),
    //     ],
    //   ),
    //   // bottomNavigationBar: _getBottomAppBar(),
    // );
  }

  }

