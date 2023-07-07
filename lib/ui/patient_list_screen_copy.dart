import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/patient_list/patient_list_bloc.dart';
import '../bloc/patient_list/patient_list_event.dart';
import '../bloc/patient_list/patient_list_state.dart';


//stf
class SmartPgxSTF extends StatefulWidget {
  const SmartPgxSTF({super.key});

  @override
  State<SmartPgxSTF> createState() => _SmartPgxSTFState();
}

class _SmartPgxSTFState extends State<SmartPgxSTF> {



  //call the bloc on init state
  @override
  void initState() {
    ///call the bloc method on init state
    BlocProvider.of<SmartPgxBloc>(context).add(SetDataToSmartPgx());
    super.initState();

  }

  //call
  bool isLoading = false;



  late double width;
  late double height;



  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height*0.06,
              ),
              TextField(
                controller: searchController,
                onChanged: (value){
                  BlocProvider.of<SmartPgxBloc>(context).add(
                    SetDataToSearch(
                      search: searchController.text,
                    ),
                  );


                },

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search Patient',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),

              BlocBuilder<SmartPgxBloc,SmartPgxState>(
                  builder: (context,state){
                    return state is SmartPgxInProgressState ?
                    const Center(
                      child: CircularProgressIndicator(),
                    ):
                    state is SmartPgxDataIsLoadedState ?
                    Column(
                      children: [
                        SizedBox(
                          height: height*0.03,
                        ),
                        // isLoading ? const CircularProgressIndicator():
                        SizedBox(
                          height: height*0.75,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.smartPgxApiModel.data.patients.length,
                            itemBuilder: (context, index) {
                              final data = state.smartPgxApiModel.data.patients[index];
                              // final item = dataList[index];
                              // final name = item['name'];
                              // final date = item['date'];
                              return ListTile(
                                leading: Image.asset('assets/images/girl2.png'),
                                title: Text('${data.firstName} ${data.lastName}'),
                                subtitle: Text(data.dob),
                              );
                            },
                          ),
                        ),
                      ],
                    ):
                    state is SmartPgxDataIsLoadedState ?
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: height*0.06,
                            ),
                            TextField(
                              controller: searchController,
                              onChanged: (value){
                                BlocProvider.of<SmartPgxBloc>(context).add(
                                  SetDataToSearch(
                                    search: searchController.text,
                                  ),
                                );


                              },

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Search Patient',
                                hintStyle: const TextStyle(color: Colors.black),
                                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                                contentPadding: const EdgeInsets.all(16.0),
                              ),
                            ),
                            SizedBox(
                              height: height*0.01,
                            ),
                            // isLoading ? const CircularProgressIndicator():
                            SizedBox(
                              height: height*0.75,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.smartPgxApiModel.data.patients.length,
                                itemBuilder: (context, index) {
                                  final data = state.smartPgxApiModel.data.patients[index];
                                  // final item = dataList[index];
                                  // final name = item['name'];
                                  // final date = item['date'];
                                  return ListTile(
                                    leading: Image.asset('assets/images/girl2.png'),
                                    title: Text('${data.firstName} ${data.lastName}'),
                                    subtitle: Text(data.dob),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),
                      ],
                    )


                        : state is SmartPgxInProgressStateTwo ?
                    const Center(
                      child: CircularProgressIndicator(),
                    ):

                    state is SmartPgxDataIssLoadedState ?

                    Column(
                      children: [
                        SizedBox(
                          height: height*0.03,
                        ),








                        Column(
                          children: [
                            SizedBox(
                              height: height*0.75,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.searchApiModel.data.patients.length,
                                itemBuilder: (context, index) {
                                  final data = state.searchApiModel.data.patients[index];
                                  // final item = dataList[index];
                                  // final name = item['name'];
                                  // final date = item['date'];
                                  return ListTile(
                                    leading: Image.asset('assets/images/girl2.png'),
                                    title: Text('${data.firstName} ${data.lastName}'),
                                    subtitle: Text(data.dob),

                                    //title: Text('${state.searchApiModel.data.firstName} ${state.searchApiModel.data.lastName}  '),
                                    // subtitle: Text('${state.searchApiModel.data.id}'),
                                    // subtitle: Text(data.id),
                                    // title: Text(hisseResult?.result![index].code ?? ""),
                                    // subtitle: Text(hisseResult?.result![index].code ?? ""),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                      ],
                    ):

                    const SizedBox();




                  }


              ),





            ],
          ),
        ),
      ),
    );

  }
}


