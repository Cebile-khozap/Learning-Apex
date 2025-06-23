public virtual class Animal {
 
//Declaring variables, default access modifier is private
public string name;
public integer age;
public string color;
    
//parameterized constructors
    public Animal(string name,integer age,string color ){
      this.name=name;
      this.age=age;
      this.color=color;
    }
    
     public void Display()
    {
       system.debug('Animal Name:'+name);  
       system.debug('Animal age:'+ age);  
       system.debug('Animal Color:'+color);  
    }
    
    public void speak()
    {
        
    }
    
    
    public void Sleep()
    {
       
    }

    public void  Walk()
    {
    
    }
    
    
    
}