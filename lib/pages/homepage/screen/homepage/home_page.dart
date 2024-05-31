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
        padding: const EdgeInsets.only(right: 19, left: 19, top: 5),
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
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          UsdToAny(
                            rate: snapshot.data!.rates,
                            currency: currsnapshot.data!,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ConvertToAny(
                            rate: snapshot.data!.rates,
                            currency: currsnapshot.data!,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Currency",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800]),
                              ),
                              const Text(
                                "See all",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              //color: Colors.white,
                            ),
                            child: FutureBuilder(
                                future: result,
                                builder: (context, snapshot1) {
                                  if (snapshot1.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.deepPurple),
                                      ),
                                    );
                                  }
                                  return FutureBuilder(
                                      future: allCurrencies,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.deepPurple),
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: Container(
                                                  height: 75,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.white,
                                                  ),
                                                  child: ListTile(
                                                    leading: CircleAvatar(
                                                      radius: 26,
                                                      backgroundColor: index > 9
                                                          ? colors[index % 10]
                                                          : colors[index],
                                                      child: Text(
                                                        snapshot.data!.keys
                                                            .toList()[index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      snapshot.data!.values
                                                          .toList()[index]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15),
                                                    ),
                                                    subtitle: Text(
                                                      snapshot1
                                                          .data!
                                                          .rates[snapshot
                                                              .data!.keys
                                                              .toList()[index]
                                                              .toString()]!
                                                          .toStringAsFixed(2)
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      }
                                      //
                                      );
                                }),
                          )
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
