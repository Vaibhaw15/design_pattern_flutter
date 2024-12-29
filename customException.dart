void main() {
 try{
   deposite(-200);
 }catch(e){
   if(e is DepositeException ){
   print(e.getErrorMessage());
   }
 }finally{
   print("Always print");
 }
}


class DepositeException implements Exception{
  String getErrorMessage(){
    return "You Can not enter less than 0 amount";
  }
}


void deposite(int money){
 if(money < 0){
   throw DepositeException();
 }
}
