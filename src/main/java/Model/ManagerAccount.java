  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSysem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Shaveen
 */
public class ManagerAccount {
    private String FullName;
    private String Email;
    private String Type;
    
    
    public ManagerAccount(){}
   
     public ManagerAccount(String FullName, String Email, String Type) {
        this.FullName = FullName;
        this.Email = Email;
        this.Type = Type;
        
    }

    public String getFullName() {
        return this.FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getEmail() {
        return this.Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getType() {
        return this.Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
}
