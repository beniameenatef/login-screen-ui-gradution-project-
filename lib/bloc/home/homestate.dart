
abstract class qualityhomestates {}

class qualityhomeInitialState extends qualityhomestates {}

class qualitytapappbarstate extends qualityhomestates {}

class qualitytStaffapappbarstate extends qualityhomestates {}

class qualitynavigationbarstate extends qualityhomestates {}


class qualitycheckconnectionloadingstate extends qualityhomestates {}
class qualitycheckconnectionsuccessstate extends qualityhomestates {}
class qualitycheckconnectionerrorstate extends qualityhomestates {
  final String? error;
  qualitycheckconnectionerrorstate(this.error);}



class qualitypostastaffloadingstate extends qualityhomestates {}
class qualitypostastaffsuccessstate extends qualityhomestates {}
class qualitypostastafferrorstate extends qualityhomestates {
  final String? error;
  qualitypostastafferrorstate(this.error);}

class qualitydeleteastaffloadingstate extends qualityhomestates {}
class qualitydeleteastaffsuccessstate extends qualityhomestates {}
class qualitydeleteastafferrorstate extends qualityhomestates {
  final String? error;
  qualitydeleteastafferrorstate(this.error);}

class qualityputastaffloadingstate extends qualityhomestates {}
class qualityputastaffsuccessstate extends qualityhomestates {}
class qualityputastafferrorstate extends qualityhomestates {
  final String? error;
  qualityputastafferrorstate(this.error);}


class qualitypostmstaffloadingstate extends qualityhomestates {}
class qualitypostmstaffsuccessstate extends qualityhomestates {}
class qualitypostmstafferrorstate extends qualityhomestates {
  final String? error;
  qualitypostmstafferrorstate(this.error);}

class qualitydeletemstaffloadingstate extends qualityhomestates {}
class qualitydeletemstaffsuccessstate extends qualityhomestates {}
class qualitydeletemstafferrorstate extends qualityhomestates {
  final String? error;
  qualitydeletemstafferrorstate(this.error);}

class qualityputmstaffloadingstate extends qualityhomestates {}
class qualityputmstaffsuccessstate extends qualityhomestates {}
class qualityputmstafferrorstate extends qualityhomestates {
  final String? error;
  qualityputmstafferrorstate(this.error);}



class qualitypostbooktypeloadingstate extends qualityhomestates {}
class qualitypostbooktypesuccessstate extends qualityhomestates {}
class qualitypostbooktypeerrorstate extends qualityhomestates {
  final String? error;
  qualitypostbooktypeerrorstate(this.error);}

class qualitydeletebooktypeloadingstate extends qualityhomestates {}
class qualitydeletebooktypesuccessstate extends qualityhomestates {}
class qualitydeletebooktypeerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletebooktypeerrorstate(this.error);}

class qualityputbooktypeloadingstate extends qualityhomestates {}
class qualityputbooktypesuccessstate extends qualityhomestates {}
class qualityputbooktypeerrorstate extends qualityhomestates {
  final String? error;
  qualityputbooktypeerrorstate(this.error);}



class qualitypostlabloadingstate extends qualityhomestates {}
class qualitypostlabsuccessstate extends qualityhomestates {}
class qualitypostlaberrorstate extends qualityhomestates {
  final String? error;
  qualitypostlaberrorstate(this.error);}

class qualitydeletelabloadingstate extends qualityhomestates {}
class qualitydeletelabsuccessstate extends qualityhomestates {}
class qualitydeletelaberrorstate extends qualityhomestates {
  final String? error;
  qualitydeletelaberrorstate(this.error);}

class qualityputlabloadingstate extends qualityhomestates {}
class qualityputlabsuccessstate extends qualityhomestates {}
class qualityputlaberrorstate extends qualityhomestates {
  final String? error;
  qualityputlaberrorstate(this.error);}



class qualitypostoneyearloadingstate extends qualityhomestates {}
class qualitypostoneyearsuccessstate extends qualityhomestates {}
class qualitypostoneyearerrorstate extends qualityhomestates {
  final String? error;
  qualitypostoneyearerrorstate(this.error);}

class qualitydeleteoneyearloadingstate extends qualityhomestates {}
class qualitydeleteoneyearsuccessstate extends qualityhomestates {}
class qualitydeleteoneyearerrorstate extends qualityhomestates {
  final String? error;
  qualitydeleteoneyearerrorstate(this.error);}

class qualityputoneyearloadingstate extends qualityhomestates {}
class qualityputoneyearsuccessstate extends qualityhomestates {}
class qualityputoneyearerrorstate extends qualityhomestates {
  final String? error;
  qualityputoneyearerrorstate(this.error);}



class qualitypostlibraryloadingstate extends qualityhomestates {}
class qualitypostlibrarysuccessstate extends qualityhomestates {}
class qualitypostlibraryerrorstate extends qualityhomestates {
  final String? error;
  qualitypostlibraryerrorstate(this.error);}

class qualitydeletelibraryloadingstate extends qualityhomestates {}
class qualitydeletelibrarysuccessstate extends qualityhomestates {}
class qualitydeletelibraryerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletelibraryerrorstate(this.error);}

class qualityputlibraryloadingstate extends qualityhomestates {}
class qualityputlibrarysuccessstate extends qualityhomestates {}
class qualityputlibraryerrorstate extends qualityhomestates {
  final String? error;
  qualityputlibraryerrorstate(this.error);}



class qualitypostgraduatednumberloadingstate extends qualityhomestates {}
class qualitypostlgraduatednumbersuccessstate extends qualityhomestates {}
class qualitypostgraduatednumbererrorstate extends qualityhomestates {
  final String? error;
  qualitypostgraduatednumbererrorstate(this.error);}

class qualityputgraduatednumberloadingstate extends qualityhomestates {}
class qualityputgraduatednumbersuccessstate extends qualityhomestates {}
class qualityputgraduatednumbererrorstate extends qualityhomestates {
  final String? error;
  qualityputgraduatednumbererrorstate(this.error);}

class qualitydeletegraduatednumberloadingstate extends qualityhomestates {}
class qualitydeletegraduatednumbersuccessstate extends qualityhomestates {}
class qualitydeletegraduatednumbererrorstate extends qualityhomestates {
  final String? error;
  qualitydeletegraduatednumbererrorstate(this.error);}



class qualitypostprotocolloadingstate extends qualityhomestates {}
class qualitypostlprotocolsuccessstate extends qualityhomestates {}
class qualitypostprotocolerrorstate extends qualityhomestates {
  final String? error;
  qualitypostprotocolerrorstate(this.error);}

class qualityputprotocolloadingstate extends qualityhomestates {}
class qualityputprotocolsuccessstate extends qualityhomestates {}
class qualityputprotocolerrorstate extends qualityhomestates {
  final String? error;
  qualityputprotocolerrorstate(this.error);}

class qualitydeleteprotocolloadingstate extends qualityhomestates {}
class qualitydeleteprotocolsuccessstate extends qualityhomestates {}
class qualitydeleteprotocolerrorstate extends qualityhomestates {
  final String? error;
  qualitydeleteprotocolerrorstate(this.error);}



class qualitypostresearchloadingstate extends qualityhomestates {}
class qualitypostresearchsuccessstate extends qualityhomestates {}
class qualitypostresearcherrorstate extends qualityhomestates {
  final String? error;
  qualitypostresearcherrorstate(this.error);}

class qualityputresearchloadingstate extends qualityhomestates {}
class qualityputresearchsuccessstate extends qualityhomestates {}
class qualityputresearcherrorstate extends qualityhomestates {
  final String? error;
  qualityputresearcherrorstate(this.error);}

class qualitydeleteresearchloadingstate extends qualityhomestates {}
class qualitydeleteresearchsuccessstate extends qualityhomestates {}
class qualitydeleteresearcherrorstate extends qualityhomestates {
  final String? error;
  qualitydeleteresearcherrorstate(this.error);
}



class qualitypoststudentactivityloadingstate extends qualityhomestates {}
class qualitypoststudentactivitysuccessstate extends qualityhomestates {}
class qualitypoststudentactivityerrorstate extends qualityhomestates {
  final String? error;
  qualitypoststudentactivityerrorstate(this.error);}

class qualityputstudentactivityloadingstate extends qualityhomestates {}
class qualityputstudentactivitysuccessstate extends qualityhomestates {}
class qualityputstudentactivityerrorstate extends qualityhomestates {
  final String? error;
  qualityputstudentactivityerrorstate(this.error);}

class qualitydeletestudentactivityloadingstate extends qualityhomestates {}
class qualitydeletestudentactivitysuccessstate extends qualityhomestates {}
class qualitydeletestudentactivityerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletestudentactivityerrorstate(this.error);
}




class qualitypoststudentdistributionloadingstate extends qualityhomestates {}
class qualitypoststudentdistributionsuccessstate extends qualityhomestates {}
class qualitypoststudentdistributionerrorstate extends qualityhomestates {
  final String? error;
  qualitypoststudentdistributionerrorstate(this.error);}

class qualityputstudentdistributionloadingstate extends qualityhomestates {}
class qualityputstudentdistributionsuccessstate extends qualityhomestates {}
class qualityputstudentdistributionerrorstate extends qualityhomestates {
  final String? error;
  qualityputstudentdistributionerrorstate(this.error);}

class qualitydeletestudentdistributionloadingstate extends qualityhomestates {}
class qualitydeletestudentdistributionsuccessstate extends qualityhomestates {}
class qualitydeletestudentdistributionerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletestudentdistributionerrorstate(this.error);
}



class qualitypoststudenttransactionloadingstate extends qualityhomestates {}
class qualitypoststudenttransactionsuccessstate extends qualityhomestates {}
class qualitypoststudenttransactionerrorstate extends qualityhomestates {
  final String? error;
  qualitypoststudenttransactionerrorstate(this.error);}

class qualityputstudenttransactionloadingstate extends qualityhomestates {}
class qualityputstudenttransactionsuccessstate extends qualityhomestates {}
class qualityputstudenttransactionerrorstate extends qualityhomestates {
  final String? error;
  qualityputstudenttransactionerrorstate(this.error);}

class qualitydeletestudenttransactionloadingstate extends qualityhomestates {}
class qualitydeletestudenttransactionsuccessstate extends qualityhomestates {}
class qualitydeletestudenttransactionerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletestudenttransactionerrorstate(this.error);
}




class qualitypostsurveyitemloadingstate extends qualityhomestates {}
class qualitypostsurveyitemsuccessstate extends qualityhomestates {}
class qualitypostsurveyitemerrorstate extends qualityhomestates {
  final String? error;
  qualitypostsurveyitemerrorstate(this.error);}

class qualityputsurveyitemloadingstate extends qualityhomestates {}
class qualityputsurveyitemsuccessstate extends qualityhomestates {}
class qualityputsurveyitemerrorstate extends qualityhomestates {
  final String? error;
  qualityputsurveyitemerrorstate(this.error);}

class qualitydeletesurveyitemloadingstate extends qualityhomestates {}
class qualitydeletesurveyitemsuccessstate extends qualityhomestates {}
class qualitydeletesurveyitemerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletesurveyitemerrorstate(this.error);
}



class qualitypostsurveyloadingstate extends qualityhomestates {}
class qualitypostsurveysuccessstate extends qualityhomestates {}
class qualitypostsurveyerrorstate extends qualityhomestates {
  final String? error;
  qualitypostsurveyerrorstate(this.error);}

class qualityputsurveyloadingstate extends qualityhomestates {}
class qualityputsurveysuccessstate extends qualityhomestates {}
class qualityputsurveyerrorstate extends qualityhomestates {
  final String? error;
  qualityputsurveyerrorstate(this.error);}

class qualitydeletesurveyloadingstate extends qualityhomestates {}
class qualitydeletesurveysuccessstate extends qualityhomestates {}
class qualitydeletesurveyerrorstate extends qualityhomestates {
  final String? error;
  qualitydeletesurveyerrorstate(this.error);
}

