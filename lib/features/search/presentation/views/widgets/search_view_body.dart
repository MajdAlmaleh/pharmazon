import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/views/widgets/custom_search_bar.dart';

import 'classifications_search_items.dart';
import 'commercial_name_search_items.dart';
import 'search_option_item.dart';

final controller = TextEditingController();

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

bool isClassifications = true;

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomSearchBar(
            controller: controller,
            onSearch: (searchText) {
              if (searchText.trim().isEmpty) {
                return;
              }
              if (isClassifications) {
                BlocProvider.of<ClassificationsSearchCubit>(context)
                    .searchByClassifications(classification: searchText);
                return;
              }
              BlocProvider.of<CommercialNameSearchCubit>(context)
                  .searchByCommercialName(commercialName: searchText);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (!isClassifications) {
                    setState(
                      () {
                        isClassifications = true;
                      },
                    );
                  }
                },
                child: SearchOptionItem(
                  text: 'Classifications',
                  color: isClassifications ? Colors.grey : Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  if (isClassifications) {
                    setState(
                      () {
                        isClassifications = false;
                      },
                    );
                  }
                },
                child: SearchOptionItem(
                  text: 'Comercial name',
                  color: !isClassifications ? Colors.grey : Colors.white,
                ),
              ),
            ],
          ),
          if (!isClassifications) const CommercialNameSearchItems(),
          if (isClassifications) const ClassificationsSearchItems(),
        ],
      ),
    );
  }
}
