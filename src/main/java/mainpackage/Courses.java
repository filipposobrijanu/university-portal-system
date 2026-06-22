package mainpackage;

public class Courses {
    private String courseCode;
    private String title;
    private int credits;
    private Professors professor;

    public Courses(String courseCode, String title, int credits) {
        this.courseCode = courseCode;
        this.title = title;
        this.credits = credits;
    }

    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public int getCredits() { return credits; }
    public void setCredits(int credits) { this.credits = credits; }
    public Professors getProfessor() { return professor; }
    public void setProfessor(Professors professor) { this.professor = professor; }

    @Override
    public String toString() {
        return "Courses{" +
                "courseCode='" + courseCode + '\'' +
                ", title='" + title + '\'' +
                ", credits=" + credits +
                ", professor=" + (professor != null ? professor.getUsername() : "None") +
                '}';
    }
}