/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class EditAccountAdmin {
    private String FullName;
    private String Email;
    private String Type;
    private String Pwd;
    
    public EditAccountAdmin(){}
   
     public EditAccountAdmin(String FullName, String Email,String Type, String Password) {
        this.FullName = FullName;
        this.Email = Email;
        this.Type = Type;
        this.Pwd = Password;
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
     public String getPwd() {
        return this.Pwd;
    }

    public void setPwd(String Pwd) {
        this.Pwd = Pwd;
    }
}
