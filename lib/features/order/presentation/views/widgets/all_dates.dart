import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/order/presentation/manager/dates_cubit/dates_cubit.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/date_list_view_item.dart';
import 'package:pharmazon/generated/l10n.dart';

class AllDates extends StatelessWidget {
  const AllDates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesCubit, DatesState>(
      builder: (context, state) {
        if (state is DatesLoading) {
          return const CustomLoading();
        }
        if (state is DatesFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is DatesSuccess) {
          if (state.dates.isEmpty) {
            return Center(
              child: Center(
                child: LiquidPullToRefresh(
                  color: kAppColor,
                  onRefresh: () async {
                    await BlocProvider.of<DatesCubit>(context)
                        .fetchDateFromUser();
                  },
                  child: Text(S.of(context).thereIsNoOrders),
                ),
              ),
            );
          }

          return Expanded(
            child: LiquidPullToRefresh(
              color: kAppColor,
              onRefresh: () async {
                await BlocProvider.of<DatesCubit>(context).fetchDateFromUser();
              },
              child: ListView.builder(
                itemCount: state.dates.length,
                itemBuilder: (context, index) {
                  return DateListViewItem(
                      date: state.dates[state.dates.length - index - 1]);
                },
              ),
            ),
          );
        }
        return Center(
            child: Center(child: Text(S.of(context).thereIsNoOrders)));
      },
    );
  }
}
