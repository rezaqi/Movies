import 'package:bloc/bloc.dart';
import 'package:movies/bloc/profile/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfileUser extends Cubit<ProfileState> {
  GetProfileUser() : super(ProfileInitState());

  String name = "";
  int avaterId = 1;
  late SharedPreferences shapref;
  getUser() async {
    emit(ProfileLoadingState());
    shapref = await SharedPreferences.getInstance();
    name = shapref.getString("name") ?? "";
    avaterId = shapref.getInt("avaterId") ?? 1;
    emit(ProfileSuccessState());
  }

  logOut(_) {
    shapref.remove("name");
    shapref.remove("email");
    shapref.remove("phone");
    shapref.remove("pass");
    shapref.remove("avaterId");
    shapref.remove("isLogin");
  }
}
