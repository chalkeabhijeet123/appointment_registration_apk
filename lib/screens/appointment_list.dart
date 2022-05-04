// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:appointment_registration_apk/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppointmentList extends StatefulWidget {
  AppointmentList({Key? key, this.listData}) : super(key: key);
  var listData;

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 195, 240),
        leading: InkWell(
          onTap: (() => Navigator.pop(context)),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Appointment List',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: DatabaseService().bookingDetails,
        // stream: FirebaseFirestore.instance
        //     .collection('appointmentData')
        //     .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return SizedBox(
              height: double.infinity,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              )),
            );
          } else {
            return SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: snapshot.data!.docs.map((document) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 6,
                      child: BContainer(
                        name: document['name'],
                        email: document['email'],
                        date: document['date'],
                        time: document['time'],
                        comment: document['comment'],
                        onTap: () {
                          print('delete button pressed');
                          print('document data: ${document.id}');

                          DatabaseService().deleteBooking(document.id);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class BContainer extends StatelessWidget {
  const BContainer({
    Key? key,
    required this.name,
    required this.email,
    required this.date,
    required this.time,
    required this.comment,
    required this.onTap,
  }) : super(key: key);
  final name, email, date, time, comment, onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          gradient: const LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Colors.grey,
              Colors.white,
            ],
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  name,
                  style: const TextStyle(overflow: TextOverflow.fade),
                ),
              ),
              Text(date),

              // Text('Abhijeet'),
              // Text('abhijeet@gmail.com'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  email,
                  style: const TextStyle(overflow: TextOverflow.fade),
                ),
              ),
              Text(time),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    comment,
                    style: const TextStyle(overflow: TextOverflow.fade),
                  )),
              InkWell(
                onTap: onTap,
                child: const Icon(
                  Icons.delete_rounded,
                  size: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
