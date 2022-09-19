import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckFirestoreDevicesScreen extends StatefulWidget {
  const CheckFirestoreDevicesScreen({Key? key}) : super(key: key);

  @override
  State<CheckFirestoreDevicesScreen> createState() => _CheckFirestoreDevicesScreenState();
}

class _CheckFirestoreDevicesScreenState extends State<CheckFirestoreDevicesScreen> {
  geeeeet() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =  await FirebaseFirestore.instance.collection('Devices').doc('962799449242').get();
    print(documentSnapshot.exists);
    print(documentSnapshot.exists);
    print(documentSnapshot.exists);
    print(documentSnapshot.exists);
  }
  @override
  void initState() {
    geeeeet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Devices').doc('962799449242').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }else{

            if(snapshot.data!.data()==null){
              return const Center(child: Text('Please Connect Device From Clinic App In Your Phone'));
            }else{
              return Container(
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Model',style: TextStyle(color: Colors.white),),
                        Text(snapshot.data!.data()!['Model'],style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Device',style: TextStyle(color: Colors.white),),
                        Text(snapshot.data!.data()!['Device'],style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
