public class ApexHoursLoops {

    public static void listDemo()
    {
       
      List<string> fruits= new List<string>();
     fruits.add('Apple');
        fruits.add('Banana');
        fruits.add('Peach');
        fruits.add('Mango');
         /*
          // Traditional Loop undetstanding
         //list index always starts with 0
         //last index= size-1
         
        integer size= Fruits.size();
        
        for(integer i=0;i<size;i++)
        {   
            string FruitName= fruits.get(i);
            system.debug(FruitName);
        }
       */
        
        // Iteration loop understanding
        for(string fruit:Fruits)
        {
            system.debug(fruit);
        }
      //Retrieve a list of accoounts
      
      List<Account> accounts= new List<account>();
       for(Account acc :accounts) 
           system.debug(acc.Name);
        
    }
}