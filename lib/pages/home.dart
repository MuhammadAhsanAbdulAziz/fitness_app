import 'package:fitness_app/models/category_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:fitness_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> catList = [];
  List<DietModel> dietList = [];
  List<PopularModel> popularList = [];

  void getInitialInfo() {
    catList = CategoryModel.getCategoryModel();
    dietList = DietModel.getDiets();
    popularList = PopularModel.getPopularModel();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        body: ListView(
          children: [
            searchField(),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            categorySection(),
            const SizedBox(
              height: 40,
            ),
            DietSection(),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Popular",style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                const SizedBox(height: 40,),
                ListView.separated(
                  itemCount: popularList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height:25),
                  padding: const EdgeInsets.only(left:20,right:20),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.07),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(popularList[index].iconPath,width: 65,height:65),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(popularList[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          Text(
                              '${popularList[index].level} | ${popularList[index].duration} | ${popularList[index].calories}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color.fromARGB(96, 0, 0, 0)))
                            ],
                          ),
                          GestureDetector(onTap:() {
                            
                          },child: SvgPicture.asset('assets/icons/button.svg'))
                        ],
                      ),
                    );
                  },
                )
                ],
            )
          ],
        ));
  }

  Column DietSection() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Recommendation \nfor Diet",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemCount: dietList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 15,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: catList[index].bgColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: SvgPicture.asset(dietList[index].iconPath),
                          ),
                          Text(dietList[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          Text(
                              '${dietList[index].level} | ${dietList[index].duration} | ${dietList[index].calories}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color.fromARGB(96, 0, 0, 0))),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  dietList[index].isSelected? const Color(0xff9DCEFF) : Colors.transparent,
                                  dietList[index].isSelected? const Color(0xff92A3FD) : Colors.transparent
                                ]
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: Text(
                                "View",
                                style: TextStyle(
                                  color: dietList[index].isSelected ? Colors.white : const Color.fromARGB(255, 0, 220, 70) ,
                                  fontWeight: FontWeight.w600
                                ),),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
  }

  Column categorySection() {
    return Column(
      children: [
        Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: catList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: catList[index].bgColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(catList[index].iconPath),
                      ),
                    ),
                    Text(catList[index].name)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Pancake",
            hintStyle: const TextStyle(
                color: Color.fromARGB(111, 158, 158, 158), fontSize: 15),
            filled: true,
            contentPadding: const EdgeInsets.all(15),
            fillColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromARGB(139, 0, 0, 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              width: 20, height: 20),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child:
                SvgPicture.asset('assets/icons/dots.svg', width: 5, height: 5),
          ),
        )
      ],
    );
  }
}
