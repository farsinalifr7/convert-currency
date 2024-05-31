import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConvertToAny extends StatelessWidget {
  const ConvertToAny({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        color: Colors.grey[500], fontWeight: FontWeight.w400),
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
                          color: Colors.pink[800], fontWeight: FontWeight.w600),
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
