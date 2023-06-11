import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_project/design.dart';
import 'package:new_project/payments.dart';
import 'package:new_project/user.dart';
import 'package:new_project/work_entries.dart';
import 'appbar.dart';

/// Flutter code sample for [BottomNavigationBar].

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  void _onItemTapped(int index) {
    switch (index) {
      case 0: Navigator.push(context, MaterialPageRoute(builder: (context) => const User()));
      case 1: Navigator.push(context, MaterialPageRoute(builder: (context) => const Design()));
      case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkEntries()));
      case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => const Payments()));
      break;
    }
  }
  
  final String title='StitchVault';
  final items_list = [
    Image.asset('lib/images/Image1.jpg'),
    Image.asset('lib/images/Embroidery-Machine.jpg'),
    Image.asset('lib/images/thread.jpg'),
  ];
  int curr_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BaseAppBar(title: title),
      body: 
          ListView(
            children: [
              CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      child: Image.asset('lib/images/Image1.jpg',width: MediaQuery.of(context).size.width/2,fit: BoxFit.fill),
                    ),
                      
                    //2nd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      child: Image.asset('lib/images/Embroidery-Machine.jpg',width: MediaQuery.of(context).size.width/2,fit: BoxFit.fill),
                    ),
                      
                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      child: Image.asset('lib/images/thread.jpg',width: MediaQuery.of(context).size.width/2,fit: BoxFit.fill),
                    ),
              ],
                  
                //Slider Container properties
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*(2/6),
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 1/1,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 1,
                    onPageChanged: (index,reason) {setState(() {
                      curr_index = index;
                    });}
                  ),
              ),
              DotsIndicator(
                dotsCount: items_list.length,
                position: curr_index.toDouble(),
                ),
              Container(
                height: MediaQuery.of(context).size.height*(1/2),
                width: MediaQuery.of(context).size.width*(2/3),
                alignment: Alignment.center,
                child: const Text("My Table")
              ),
            ],
          ),
        
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'Designs',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Work Entries',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_outlined),
            label: 'Payments',
            backgroundColor: Colors.blue
          ),
        ],
        onTap: _onItemTapped,
        selectedItemColor: Colors.grey
      ),
    );
  }
}
