import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class logincubit extends Cubit<qualityloginstates> {
  logincubit() : super(qualityloginInitialState());

  static logincubit get(context) => BlocProvider.of(context);


  bool ispassword =true;
void visibal()
{
  ispassword=!ispassword;
  emit(visibalSuccessState());

}
bool isbrache=true;
void branch()
{
  isbrache=!isbrache;
  emit(brancheSuccessState());
}
}