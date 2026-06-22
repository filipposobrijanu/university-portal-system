package mainpackage;

public class Secretaries extends Users {
    private String office;

    public Secretaries(String username, String password, String name, String surname, String department, String office) {
        super(username, password, name, surname, department);
        this.office = office;
    }

    public String getOffice() { return office; }
}