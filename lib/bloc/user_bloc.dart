import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:naya_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      try {
        Uri uri = Uri.parse('https://friends-ledger-mobile-api.vercel.app/api/signIn');

        final email = event.email;
        final password = event.password;
        RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
        if(!emailRegex.hasMatch(email)){
          return emit(AuthFailure(errorMessage: "please enter a valid email!"));
        }

        emit(AuthLoading());
        http.Response res = await http.post(
          uri,
          body: json.encode({
            "email":email,
            "number":"", 
            "password":password
          }),
          headers: <String, String>{
            'Content-Type':'application/json; charset=UTF-8',
          }
        );
      
       switch (res.statusCode) {
         case 400:
           return emit( AuthFailure(errorMessage: jsonDecode(res.body)['error']));
           
          case 500: return emit( AuthFailure(errorMessage: jsonDecode(res.body)['error']));
          
          case 200: return emit(AuthSuccess());
       }
      
        //email validation using regex
      
      } catch (e) {
        return emit(AuthFailure(errorMessage: e.toString()));
      }
    });
    on<UserInitialEVent>((event, emmit) async{
      return emmit(UserInitial());
    });
  }
}
