package mainpackage;

public class Students extends Users {
    private final int registrationNumber;

    public Students(String username,String password, String name, String surname, String department, int registrationNumber) {
        super(username,password, name, surname, department);
        this.registrationNumber = registrationNumber;
    }

    public int getRegistrationNumber() { return registrationNumber; }

    public void viewGrades() {
        System.out.println("Viewing grades for student: " + getUsername());
    }

    @Override
    public String toString() {
        return "Students{" +
                "registrationNumber=" + registrationNumber +
                ", " + super.toString() +
                '}';
    }
}