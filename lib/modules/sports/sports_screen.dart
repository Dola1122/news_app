import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        builder: (context, state) {

          var list  = NewsAppCubit.get(context).sports;

          return list.length != 0 ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem(list[index],context);
              },
              separatorBuilder: (context, index) {
                return itemDividor();
              },
              itemCount: list.length)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {});
  }
}
