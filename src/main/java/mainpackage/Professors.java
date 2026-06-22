package mainpackage;

public class Professors extends Users {
    private String specialization;

    public Professors(String username, String password, String name, String surname, String department, String specialization) {
        super(username, password, name, surname, department);
        this.specialization = specialization;
    }

    public String getSpecialization() { return specialization; }
}