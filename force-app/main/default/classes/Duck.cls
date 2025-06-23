public Virtual class Duck {
    
// Declaring Properties
  public string name;
  public integer age;
  public string color;
    
// Constructor implemention-parameterized
   public Duck(string name,integer age,string color)
   {
       system.debug(this); //instance
        this.name=name;
        this.age=age;
        this.color=color;
    }
    
 // Methods definition
    Public void displayInfo()
    {
       system.debug('Name:'+ name);
       system.debug('Age:'+ age);
       system.debug('Color:'+color);
           
    }
    
    Public void quack()
    {
        system.debug(name+'is quacking'); 
    }
}