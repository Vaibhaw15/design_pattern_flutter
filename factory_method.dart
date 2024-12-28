enum EmployeeType{
  programmer,
  boss,
  hr,
}

abstract class Employee{
  void work();
  // first Approach
  factory Employee(EmployeeType type){
        switch (type){
          case EmployeeType.programmer:
          return programmer();
          case EmployeeType.boss:
            return Boss();
          case EmployeeType.hr:
             return HRManager();
             default: 
               return programmer();
        }
  }
}

class programmer implements Employee{
  @override
  void work() {
   print('coding an app');
  }
}

class HRManager implements Employee{
  @override
  void work() {
     print('recruiting people');
  }

}

class Boss implements Employee{
    @override
  void work() {
    print('leading the people');
  }
}



void main(){
  Employee e = Employee(EmployeeType.programmer);
  e.work();

   Employee b = Employee(EmployeeType.boss);
   b.work();

      Employee h = Employee(EmployeeType.hr);
     h.work();
}