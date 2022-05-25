//
//
// class homedatamodel
// {
//   List<datamodel1>data=[];
//
//   homedatamodel.fromjson(Map<String,dynamic>json)
//   {
//     json['data'].forEach((element)
//     {
//       data.add(datamodel1.fromjson(element));
//     });
//   }
// }
// class datamodel1
// {
//   int ?id;
//   dataattributes?attribute;
//   datamodel1.fromjson(Map<String,dynamic>json)
//   {
//     id=json['id'];
//     attribute = json['attributes'] = dataattributes.fromjson(json['data']) ;
//
//   }
// }
// class dataattributes
// {
//   int? Number;
//   int ?Year;
//   int ?createdAt;
//   int ?updatedAt;
//   int ?publishedAt;
//   dataattributes.fromjson(Map<String,dynamic>json)
//   {
//     Number=json['Number'];
//     Year=json['Year'];
//     createdAt=json['createdAt'];
//     updatedAt=json['updatedAt'];
//     publishedAt=json['publishedAt'];
//
//   }
// }
// class graduated_number
// {
//   datamodel1? attribute2;
//
//   graduated_number.fromjson(Map<String,dynamic>json)
//   {
//     attribute2 = json['graduated_number'] = datamodel1.fromjson(json['data']) ;
//
//
//   }
// }
//
//
// class datadepartmentmodel
// {
//   List<csmodel>CSmap=[];
//   List<ismodel> ISmap=[];
//
//   datadepartmentmodel.fromjson(Map<String,dynamic>json)
//   {
//     json['CS'].forEach((element)
//     {
//       CSmap.add(csmodel.fromjson(element));
//     });
//     json['IS'].forEach((element)
//     {
//       ISmap.add(ismodel.fromjson(element));
//     });
//
//   }
//
// }
// class csmodel
// {
// datamodel1?csmo;
//   csmodel.fromjson(Map<String,dynamic>json)
//   {
//     csmo = json['data'] = datamodel1.fromjson(json['data']) ;
//
//   }
// }
// class ismodel
// {
//   datamodel1?ismo;
//
//   ismodel.fromjson(Map<String,dynamic>json)
//   {
//     ismo = json['data'] = datamodel1.fromjson(json['data']) ;
//
//   }
//
// }
//
//
//
//
//


class datamodel
{
  int ?id;
  dataattributes?attribute;
  datamodel.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    attribute = json['attributes'] = dataattributes.fromjson(json['data']) ;

  }
}
class dataattributes
{
  int? Number;
  int ?Year;
  int ?createdAt;
  int ?updatedAt;
  int ?publishedAt;
  dataattributes.fromjson(Map<String,dynamic>json)
  {
    Number=json['Number'];
    Year=json['Year'];
    createdAt=json['createdAt'];
    updatedAt=json['updatedAt'];
    publishedAt=json['publishedAt'];

  }
}