import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.deepPurple,
      Colors.purple,
      Colors.teal,
      Colors.blueGrey,
      Colors.grey,
      Colors.indigo,
      Colors.brown,
      Colors.pink,
      Colors.red,
      Colors.amber,
      Colors.deepOrange,
      Colors.green,
      Colors.lightBlue,
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "asset/images/menus.png",
            width: 40,
            height: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset("asset/images/user.png"),
          )
        ],
        title: Text('Currency Convert',
            style: GoogleFonts.aleo(
              textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
        backgroundColor: Colors.grey[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.purple[400],
                                shape: BoxShape.circle
                                // borderRadius: BorderRadius.circular(15)
                                ),
                            child: const Center(
                              child: Icon(
                                Icons.currency_pound,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text("USD to any currency",
                                style: GoogleFonts.aleo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[800]),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Enter USD",
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Convert any to any",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700]),
                          ),
                          Text(
                            "Convert any to any",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(""),
                          Container(
                            height: 28,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              "323",
                              style: TextStyle(
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.teal[400], shape: BoxShape.circle
                                // borderRadius: BorderRadius.circular(15)
                                ),
                            child: const Center(
                              child: Icon(
                                Icons.currency_exchange,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text("Convert to any currency",
                                style: GoogleFonts.aleo(
                                  textStyle: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[800]),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Enter Amount",
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Convert any to any",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700]),
                          ),
                          Text(
                            "Convert any to any",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(""),
                          Container(
                            height: 28,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.pink[100],
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              "432.4",
                              style: TextStyle(
                                  color: Colors.pink[800],
                                  fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Currency",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800]),
                ),
                const Text(
                  "See all",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 75,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 27,
                              backgroundColor: colors[index],
                              child: const Text(
                                "AF",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                              ),
                            ),
                            title: const Text("index"),
                            subtitle: const Text("subtitle"),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
