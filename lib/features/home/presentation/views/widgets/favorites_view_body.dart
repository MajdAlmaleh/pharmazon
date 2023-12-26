import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/manager/favorite_item/favorite_item_cubit.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/medicines_list_view.dart';
import 'package:pharmazon/generated/l10n.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteItemCubit, FavoriteItemState>(
      builder: (context, state) {
        if (state is FavoriteItemLoading) {
          return const Center(child: CustomLoading());
        }
        if (state is FavoriteItemFailure) {
          return CustomError(errMessage: state.errMessage);
        }

        if (state is FavoriteItemSuccess) {
          if (state.pharmaceutical.isEmpty) {
            return  Center(child: Text(S.of(context).noFavoritesYet));
          }
          return MedicinesListView(medicines: state.pharmaceutical);
        }

        return Container();
      },
    );
  }
}
