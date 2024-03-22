import 'package:flutter/material.dart';

import '../common_textfiled.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.keyboard_backspace_rounded,
            size: 30,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select City you want to Ride',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'You can ride only in your selected city',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select City*',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const CommonTextField(
                hintText: 'Select City',
                height: 50.0,
                width: 390.0,
              ),
               const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select your Vehicle Type*',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Row(
                children: List.generate(
                    3,
                    (index) => Column(
                      children: [
                        Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
          
                            ),
                       const Text('Auto', style: TextStyle(fontSize: 14),),
                      ],
                    ), ),
              ),
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Text(
                  'Make*',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const CommonTextField(
                hintText: 'Select Make',
                height: 50.0,
                width: 390.0,
              ),
              SizedBox(height: 20,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Text(
                  'Model*',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const CommonTextField(
                hintText: 'Select Model',
                height: 50.0,
                width: 390.0,
              ),
          SizedBox(height: 20,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Text(
                  'Vehicle Registration No.*',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const CommonTextField(
                hintText: 'Enter Vehicle Registration No.',
                height: 50.0,
                width: 390.0,
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.08,),
              // Spacer(),
              Center(
                child: SizedBox(
                  width: 376,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
