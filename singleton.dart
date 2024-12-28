//Apprroach 1 

class Singleton1{
  static Singleton1? _instance;

  Singleton1._internal(){
    print('PRIVATE CONSTRUCTOR RAN');
  }

  static Singleton1 getInstance(){
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}

//Apprroach 2

class Singleton2{
  static Singleton2? _instance;

  Singleton2._internal(){
    print('PRIVATE CONSTRUCTOR2 RAN');
  }
   
   static get instance{
    _instance ??= Singleton2._internal();
     return _instance!;
   }

}

//Apprroach 2


class Singleton3{
  static Singleton3? _instance;

  Singleton3._internal(){
    print('PRIVATE CONSTRUCTOR2 RAN');
  }

  factory Singleton3(){
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}

void main(){
  Singleton1 s1 = Singleton1.getInstance();
   Singleton1 s2 = Singleton1.getInstance();

     Singleton2 s3 = Singleton2.instance;
   Singleton2 s4 = Singleton2.instance;

   Singleton3 s5 = Singleton2.instance;
   Singleton3 s6 = Singleton2.instance;
}