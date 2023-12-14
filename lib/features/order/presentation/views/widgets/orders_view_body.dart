import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/order/presentation/manager/dates_cubit/dates_cubit.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DatesCubit, DatesState>(
          builder: (context, state) {
            if (state is DatesLoading) {
              return const CustomLoading();
            }
            if (state is DatesFailure) {
              return CustomError(errMessage: state.errMessage);
            }
            if (state is DatesSuccess) {
              if (state.dates.isEmpty) {
                return const Center(
                    child: Center(child: Text('there is no orders')));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: state.dates.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.dates[index].date!),
                        onTap: (){
                           context.push(AppRouter.kOrderDetailsFromDate,extra: state.dates[index]); 
                        },
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text('there is no orders'));

            // return Expanded(
            //   child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         child: ListTile(
            //           title: const Text('state.clients[index].clientName!'),
            //           onTap: () {
            //             //todo navigate to detalis 
            //           //  context.go('location');
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // );
          },
        ),
      ],
    );
  }
}
