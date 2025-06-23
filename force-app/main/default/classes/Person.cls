public class Person {
    
//Declaring properties
//First assignment Completed
public string name;
public integer age;
public String address;
public decimal salary; 
public string Phone;

    public Person(string name,integer age, decimal salary,string address,string phone){
       this.name=name;
       this.age=age;
       this.salary=salary;
       this.address=address;
       this.phone=phone;
           
    }

 public void PrintInfo(){
     system.debug('Name:'+name);
     system.debug(checkAge(age));
     system.debug('Salary:'+salary);
     system.debug('Phone:'+phone);
     system.debug(getAddress(address)); 
        
    }
    
   
    public string getAddress(string address){
        
        this.address=address;
        return address;
    }
        
    
    public integer checkAge(integer age){
        If( age >60){
            system.debug('Old Age');
        }
        else{
            system.debug('Less than 60');
        }
        return age;
    }
}