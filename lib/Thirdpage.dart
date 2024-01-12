import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'a.dart';

class Thirdpage extends StatefulWidget {
  const Thirdpage(User user, {super.key});

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
          backgroundImage: AssetImage('assets/images/1.png'),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              TextField(
                onChanged: (value) {
                  // Here you can implement your search logic
                  print('Searching for: $value');
                },
                decoration: InputDecoration(
                  labelText: 'Search Product',
                  hintText: 'Enter product name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ],
          ),
          Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          // decoration: BoxDecoration(
                          //     color: Colors.grey,
                          //     borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            height: 100,
                            width: 100,
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
            width: 328,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 16/9,
              ),
              children: [
                Container(
                  height: 156,
                  width: 135,
                  child: Image.asset("assets/images/1.png"),
                ),
                Container(
                  height: 156,
                  width: 135,
                  child: Image.asset("assets/images/2.png"),
                ),
                Container(
                  height: 156,
                  width: 135,
                  child: Image.asset("assets/images/3.png"),
                ),
                Container(
                  height: 156,
                  width: 135,
                  child: Image.asset("assets/images/4.png"),
                ),
              ],
            ),
          ),

          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => A()),
                );
              },
              child: Text(
                "View more",
              )),
        ]),
      ),
    );
  }
}
