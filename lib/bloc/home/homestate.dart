abstract class qualityhomestates {}

class qualityhomeInitialState extends qualityhomestates {}



class qualitytapappbarstate extends qualityhomestates {}

class qualitytStaffapappbarstate extends qualityhomestates {}

class qualitynavigationbarstate extends qualityhomestates {}


class qualitydataloadingstate extends qualityhomestates {}
class qualitydatasuccessstate extends qualityhomestates {}
class qualitydataerrorstate extends qualityhomestates {
  final String ?error;

  qualitydataerrorstate(this.error);
}
