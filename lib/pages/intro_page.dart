import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentmodelhive/pages/homepage/screen/homepage/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    // height: 300,
                    height: 185,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "asset/images/qwqwe.jpg",
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "asset/images/sdfasd-removebg-preview (1).png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                    " Know your money's worth. Accurate conversions, always in your pocket",
                    style: GoogleFonts.aleo(
                      textStyle: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  " You enter an amount in one currency, and the app instantly converts it to another currency using the latest exchange rates.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.purple,
                        Colors.deepPurple,
                        Colors.pink
                      ]),
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.purple[500]
                    ),
                    child: Center(
                        child: Text("Get Started",
                            style: GoogleFonts.aleo(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))),
                  ),
                )),
              ]),
        ));
  }
}
