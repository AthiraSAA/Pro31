import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'a.dart';
import 'b.dart';

class Thirdpage extends StatefulWidget {
  late String name;
   Thirdpage(User user, {super.key,required this.name});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  List<String> image = [
    "https://rukminim2.flixcart.com/fk-p-flap/850/400/image/057829e0f99cf230.jpg?q=90",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPoFAvFQ7hGfhF3NzMNc_jgNW5fmBHc2EKtPnqsweB-eikE_UF6igTkY2LzsoQjEtWOew&usqp=CAU",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0a78ef47-01c1-43e2-a389-fc73690b9100/dfpeh37-70231edc-1ee7-4b28-a666-de1c94925e05.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzBhNzhlZjQ3LTAxYzEtNDNlMi1hMzg5LWZjNzM2OTBiOTEwMFwvZGZwZWgzNy03MDIzMWVkYy0xZWU3LTRiMjgtYTY2Ni1kZTFjOTQ5MjVlMDUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.wIxBn_-oqEFKT7WuUsYjmHDCotOxaCGXDfP39W9z56c",
  ];
  List<Map> categories = [
    {'name': 'Laptop', 'iconPath': 'assets/images/laptop.png'},
    {'name': 'Mobile', 'iconPath': 'assets/images/mobile11.png'},
    {'name': 'Headphone', 'iconPath': 'assets/images/heahphone.png'},
    {'name': 'Console', 'iconPath': 'assets/images/consoles.png'},
    {'name': 'Tablets', 'iconPath': 'assets/images/tab.png'},
  ];

  get backgroundImage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/appp1.svg', fit: BoxFit.cover),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          CircleAvatar(
          backgroundImage: AssetImage('assets/images/z1.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search product that you wish to buy",
                  prefixIcon: (Icon(Icons.search))),
            ),
            SizedBox(height: 35,),
            Container(
              height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: image.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.network(
                            "${i}",
                            fit: BoxFit.fill,
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                    // textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff494949)),
                ),
              ),
            ]),
            SizedBox(height: 10,),
            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  B(name:"Laptops")),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 20),
                              child: Image.asset(
                                categories[index]['iconPath'],
                                height: 84,
                                width: 56,
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Top Products",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
                Container(
                    height: 504,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing:4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  A(name:"Laptops")),
                            );
                          },
                          child: Container(
                            height: 248,
                            child: Stack(
                              children: [
                                Positioned(
                                  left:10,
                                  right: 10,
                                  top: 10,
                                  child: Container(height: 156,
                                    width: 135,

                                    child: Image.asset("assets/images/1.png",fit: BoxFit.fill,),
                                  ),
                                ),
                                Positioned(top: 176,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color:Colors.greenAccent,
                                      ),
                                      height: 17,
                                      width: 35,
                                      child: Center(
                                        child: Text("4.3",style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white
                                        ),),
                                      ),)),
                                Positioned(top: 191,
                                    left: 10,
                                    child: Container(

                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 156,
                                            child: Text(
                                              textAlign:TextAlign.start,
                                              "Poco",
                                              style: GoogleFonts.poppins(
                                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff494949)),
                                            ),
                                          ),
                                          Container(
                                            width: 156,
                                            child: Text(
                                              "POCO C55(Forest Green)",
                                              style: GoogleFonts.poppins(
                                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff494949)),
                                            ),
                                          ),
                                          Container(
                                            width: 156,
                                            child: Text(
                                              "6 GB RAM",
                                              style: GoogleFonts.poppins(
                                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff494949)),
                                            ),
                                          ),
                                          Container(
                                            width: 156,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "-45 %  ",
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff1bbf00)),
                                                ),
                                                Text(
                                                  "\u{20B9}1399",
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 10,
                                                      decoration: TextDecoration.lineThrough,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff000000)),
                                                ),
                                                Expanded(child: SizedBox(width: 10,)),
                                                Text(
                                                  "\u{20B9}7499",
                                                  style: GoogleFonts.poppins(
                                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color(0xff000000)),
                                                ),
                                                SizedBox(width: 5,)
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color:Colors.greenAccent,
                                                ),
                                                height: 17,
                                                width: 35,
                                                child: Center(
                                                  child: Text("4.3",style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.white
                                                  ),),
                                                ),),
                                              Text(
                                                " Rating",
                                                style: GoogleFonts.poppins(
                                                  // textStyle: Theme.of(context).textTheme.displayLarge,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xff47444)),
                                              ),
                                            ],
                                          )
                                        ],
                                      )

                                      ,))
                              ],
                            ),
                          ),
                        );
                      },
                    )),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // background (button) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => A(name: '',)),
                  );
                },
                child: Text(
                  "View more",
                )),
          ]),
        ),
      ),
    );
  }
}
