import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            searchField()
          ],
        ));
  }

  Container searchField() {
    return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xff1D1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0)
            ]),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Pancake",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(111, 158, 158, 158),
                    fontSize: 15
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
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
                          VerticalDivider(
                            thickness: 0.1,
                            indent: 10,
                            endIndent: 10,
                            color: const Color.fromARGB(139, 0, 0, 0),
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
          print("haha");
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
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
