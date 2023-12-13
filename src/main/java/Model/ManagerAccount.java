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
    private String Fname;
    private String Lname;
    private String Email;
    private String Type;
    
    public ManagerAccount(){}
   
    public ManagerAccount(String Fname, String Lname, String Email, String Type)
    {
        this.Fname = Fname;
        this.Lname = Lname;
        this.Email = Email;
        this.Type = Type;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
}
