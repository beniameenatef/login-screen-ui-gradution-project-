import 'package:design_ui/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class logincubit extends Cubit<qualitystates> {
  logincubit() : super(qualityInitialState());

  static logincubit get(context) => BlocProvider.of(context);


  bool ispassword =true;
void visibal()
{
  ispassword=!ispassword;
  emit(visibalSuccessState());

}
}