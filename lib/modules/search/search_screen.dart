import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        builder: (context, state) {
          var list = NewsAppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: defaultFormField(
                    onChange: (value) {
                      NewsAppCubit.get(context).getSearch(value);
                    },
                    validateText: "search must not be empty",
                    labelText: "Search",
                    controller: searchController,
                    prefixIcon: Icons.search,
                  ),
                ),
                list.length != 0
                    ? Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildArticleItem(list[index], context);
                          },
                          separatorBuilder: (context, index) {
                            return itemDividor();
                          },
                          itemCount: list.length),
                    )
                    : Expanded(
                      child: Center(
                          child: Container(),
                        ),
                    ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
