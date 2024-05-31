import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentmodelhive/functions/fetch_details.dart';

class ConvertToAny extends StatefulWidget {
  final rate;
  final Map currency;
  const ConvertToAny({super.key, required this.rate, required this.currency});

  @override
  State<ConvertToAny> createState() => _ConvertToAnyState();
}

class _ConvertToAnyState extends State<ConvertToAny> {
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();
  String finalResult = "0.00";
  String finalString = "";
  String dropDownValue1 = "AUD";
  String dropDownValue2 = "AUD";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.31,
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
                    padding: const EdgeInsets.all(10),
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
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                        underline: Container(
                          height: 1,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        value: dropDownValue1,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        items: widget.currency.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropDownValue1 = value!;
                          });
                        }),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        underline: Container(
                          height: 1,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        value: dropDownValue2,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        items: widget.currency.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropDownValue2 = value!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        finalResult = convertAny(widget.rate, _controller.text,
                            dropDownValue1, dropDownValue2);

                        finalString =
                            "${_controller.text} $dropDownValue1 = $finalResult $dropDownValue2";
                      });
                    },
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        //color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Convert",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$dropDownValue2: ",
                          style: TextStyle(
                              color: Colors.pink[800],
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          finalResult,
                          style: TextStyle(
                              color: Colors.pink[800],
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    finalString,
                    style: const TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
