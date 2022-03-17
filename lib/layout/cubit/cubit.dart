import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  void changeScreen(int index) {
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    currentIndex = index;
    emit(NewsAppChangeScreenState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsAppGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '5cfcdce5f8774131a34ad94d7d1de16d',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsAppGetBusinessSuccessState());
    }).catchError((error) {
      print(error.tostring());
      emit(NewsAppGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsAppGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '5cfcdce5f8774131a34ad94d7d1de16d',
      }).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsAppGetSportsSuccessState());
      }).catchError((error) {
        print(error.tostring());
        emit(NewsAppGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsAppGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsAppGetBusinessLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '5cfcdce5f8774131a34ad94d7d1de16d',
      }).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsAppGetScienceSuccessState());
      }).catchError((error) {
        print(error.tostring());
        emit(NewsAppGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsAppGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsAppGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '5cfcdce5f8774131a34ad94d7d1de16d',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsAppGetSearchSuccessState());
    }).catchError((error) {
      print(error.tostring());
      emit(NewsAppGetSearchErrorState(error.toString()));
    });

  }


}

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}){
    if(fromShared != null)
      {
        isDark = fromShared;
        emit(AppChangeModeState());
      }
    else
      {
        isDark = !isDark;
        CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
          emit(AppChangeModeState());
        });
      }


  }
}