import 'package:flutter/material.dart';
import 'list.dart';

class Livres extends StatefulWidget {
  const Livres({Key? key}) : super(key: key);

  @override
  State<Livres> createState() => _LivresState();
}

class _LivresState extends State<Livres> {
   Color _iconColor = Colors.white60;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:[
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                    child: const Card(
                      elevation: 4.0,
                      child: Image(image: AssetImage('assets/book.jpg'),height: 500,fit: BoxFit.cover,),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
              Positioned(
                bottom: -20,
                  left: 66,
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
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Product Name',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                                fontSize: 22, letterSpacing: 0.5),),
                            Text("\$25,00",style: TextStyle(color: Colors.red, fontSize: 20)),
                          ],
                        ),
                      ),

                    // child: const Padding(
                    //   padding: EdgeInsets.all(22.0),
                    //   child: Text('Product Name',
                    //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                    //   fontSize: 22, letterSpacing: 0.5),),
                    // ),
                  ),
              ),
              Positioned(
                bottom: -20,
                right:68,
                child: Container(
                  decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _iconColor == Colors.white60 ?
                              _iconColor = Colors.red :
                              _iconColor = Colors.white60;

                            });
                          },
                          icon: const Icon(Icons.favorite),
                        color: _iconColor,
                      )],
                  ),
                ),
              ),


            ],
            clipBehavior: Clip.none,

          ),
          const SizedBox(height: 50,),
          SizedBox(
            // color: Colors.amber,
            width: 400,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                 Image(image: AssetImage('assets/livre.gif',),height: 60,),
                 Text('Qui Sommes-Nous', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
                // SizedBox(height: 0,)

              ],
            ),
          ),
          const SizedBox(height: 0,),
          const SizedBox(
            // color: Colors.yellow,
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('on est une équipe de Projet Fin D\'étude et on fait que'
                  ' niquer des gens de notre classe parce que on est vraiment au-dessus '
                  'du coup on fait tous ce qui nous chantes, comme ça les gars de notre group vont tous'
                  ' pécho et moi je me focaliserai oklm sur une petite jeune demoiselle que j\'aime.', textAlign: TextAlign.justify,),
            ),
          ),
          SizedBox(
            height: 190,
            // color: Colors.grey,
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
                                child:  Image(image:AssetImage(images[index]),fit: BoxFit.cover,)
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
            )
            // ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     buildCard(),
            //     const SizedBox(width: 10,),
            //     buildCard(),
            //     const SizedBox(width: 10,),
            //     buildCard(),
            //     const SizedBox(width: 10,),
            //     buildCard(),
            //     const SizedBox(width: 10,),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
  Widget buildCard() => SizedBox(
    height: 180,
    width: 170,
    // color: Colors.red,
    child: Column(
      children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(30),
             child: const Image(image:AssetImage('assets/book.jpg'),fit: BoxFit.cover,)
         ),
        const SizedBox(height: 4,),
        const Text('Book Rêve',style: TextStyle(fontSize:20 ),),
        const Text('20\$',style:  TextStyle(fontSize:20, color: Colors.red ),)
      ],
    ),
  );
  //trim()
}
