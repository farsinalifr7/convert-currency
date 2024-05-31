import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentmodelhive/functions/fetch_details.dart';
import 'package:studentmodelhive/model/rate_model.dart';
import 'package:studentmodelhive/pages/homepage/components/convert_to_any.dart';
import 'package:studentmodelhive/pages/homepage/components/usd_to_any.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RateModel> result;
  late Future<Map> allCurrencies;
  @override
  void initState() {
    super.initState();
    result = fetchRate();
    allCurrencies = fetchCurrency();
    print(result);
    print(allCurrencies);
  }

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
        child: FutureBuilder<RateModel>(
            future: result,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                );
              }

              return FutureBuilder<Map>(
                  future: allCurrencies,
                  builder: (context, currsnapshot) {
                    if (currsnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                      ));
                    }
                    return Column(
                      children: [
                        UsdToAny(
                          rate: snapshot.data!.rates,
                          currency: currsnapshot.data!,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConvertToAny(
                          rate: snapshot.data!.rates,
                          currency: currsnapshot.data!,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                    );
                  });
            }),
      ),
    );
  }
}
