package mainpackage;

public class Grades {
    private Students student;
    private Courses course;
    private double grade;

    public Grades(Students student, Courses course, double grade) {
        this.student = student;
        this.course = course;
        this.grade = grade;
    }

    public Students getStudent() { return student; }
    public void setStudent(Students student) { this.student = student; }
    public Courses getCourse() { return course; }
    public void setCourse(Courses course) { this.course = course; }
    public double getGrade() { return grade; }
    public void setGrade(double grade) { this.grade = grade; }

    @Override
    public String toString() {
        return "Grades{" +
                "student=" + student.getRegistrationNumber() + " " + student.getName() +
                ", course=" + course.getTitle() +
                ", grade=" + grade +
                '}';
    }
}