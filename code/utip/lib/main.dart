import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 133, 133)),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {

  int personCount =1;
  double sliderValue;
  int billAmount = 0;

  int tipAmount = sliderValue * billAmount;
  int totalAmount = ((tipAmount + billAmount) + billAmount) /personCount;

  //methods
  void personIncrement(){
    setState((){
      personCount++;
    });
  }

  void personDecrement(){
    setState((){
      if (personCount > 1){
        personCount--;
      }
      
    })
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UTip App"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 184, 184),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [ 
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255,255,255),
                        ), 
                        ),
                    Text(
                      "\$ $totalAmount",
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                  ],
                ),
              ],
            ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width:1.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState((){
                              billAmount = value;
                              totalAmount;
                            })
                      
                          },
                          decoration: InputDecoration(
                            labelText: "Bill Amount",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.attach_money_rounded)
                          ), 
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Split"),
                          Row(
                            children: [
                              IconButton(onPressed: personDecrement(), icon: Icon(Icons.remove)),
                              Text("$personCount"),
                              IconButton(onPressed: personIncrement(), icon: Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip",
                          style: TextStyle(

                          ), 
                          ),

                          //Tip Amount
                          Text("\$ $tipAmount"),
                        ],
                      ),
                      Text("${(sliderValue*100).round}%"),
                      Slider (
                        min: 0,
                        max: 0.5,
                        divisions: 5,
                        value:  sliderValue,
                        onChanged: (value) => {
                          setState((){
                            sliderValue = value;
                          })
                          
                        }
                      )
                        
                
                    ],
                
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}