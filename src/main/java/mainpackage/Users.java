package mainpackage;

public class Users {
    protected String username;
    protected String password;
    protected String name;
    protected String surname;
    protected String department;

    public Users(String username, String password, String name, String surname, String department) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.department = department;
    }
    
    public String getUsername() { return username; }
    public String getName() { return name; }
    public String getSurname() { return surname; }
}