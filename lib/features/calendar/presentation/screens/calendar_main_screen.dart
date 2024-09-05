import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/status.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/calendar_main_cubit.dart';
import '../widgets/calendar_events_widget.dart';
import '../widgets/card_medication_widget.dart';

class CalendarMainScreen extends StatefulWidget {
  const CalendarMainScreen({super.key});

  @override
  State<CalendarMainScreen> createState() => _CalendarMainScreenState();
}

class _CalendarMainScreenState extends State<CalendarMainScreen> with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late TabController _tabController;
  late CalendarMainCubit eventMainCubit;
  int selectedTab = 0;
  bool isNearBy = false;
  bool isSummary = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    eventMainCubit = BlocProvider.of<CalendarMainCubit>(context);
    eventMainCubit.init();

    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    //     // print('Tab changed to index: ${_tabController.index}');
    //     setState(() {});
    //   }
    // });
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightBackgroundColor,
          title: Text(
            'Medicacoes Tomadas',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<CalendarMainCubit, CalendarMainState>(
          bloc: eventMainCubit,
          listener: (context, state) {
            print('... state.currentUser: ${state.status}');

            switch (state.status) {
              case Status.loading:
                break;
              case Status.failure:
                // hideLoader();
                // showError(state.errorMessage ?? 'Some error');
                print('ERROR ${state.failure?.message}');
                break;
              case Status.success:
                break;
              case Status.initial:
                break;
            }
          },
          builder: (context, state) {
            return BlocBuilder<CalendarMainCubit, CalendarMainState>(
              bloc: eventMainCubit,
              builder: (context, state) {
                // if (state.status == Status.loading) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                // print('...state.eventsGoing=${state.eventsGoing}');

                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                          color: AppColors.lightBackgroundColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                      width: double.infinity,
                      // child: Text('HIii'),
                    ),
                    //
                    //
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // 
                          // 
                          Flexible(
                            child: Container(
                              // color: Colors.green,
                              height: MediaQuery.of(context).size.height * 0.38,
                              width: double.infinity,
                              child: CalendarEventsWidget(),
                            ),
                          ),
                          const SizedBox(height: 7),
                          // 
                          // 
                          Flexible(
                            child: Container(
                              // color: Colors.green,
                              height: MediaQuery.of(context).size.height * 0.62,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Quinta-feira, 9 setembro',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      ...state.daillyEvents.map(
                                        (event) => CardMedicationWidget(
                                          event: event,
                                          onCheck: (eventId, newValue) {
                                            print('chechekd: ${eventId} newValue=${newValue}');
                                          },
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 
                          // 
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
