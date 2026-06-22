<h1 align="center">University Academic & Grade Management System</h1>
<h3 align="center">Enterprise-Grade Academic Lifecycle & Grading Workflow Engine</h3>

<p align="center">
  A comprehensive, multi-tier enterprise web application designed to optimize academic record-keeping and grade management workflows between students, faculty members, and university registrars. Built on a robust <strong>Java EE (Jakarta EE)</strong> architecture, this system ensures reliable relational data persistence, advanced security patterns (salted SHA-256 password hashing), strict multi-role authorization, and real-time GPA processing for high-throughput academic environments.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge" alt="License" />
</p>

---

### ✨ Core System Modules

* **Student Analytics & Transcript Engine:** Implements secure authentication protocols providing students with a real-time, responsive dashboard. Features an automated analytical engine that aggregates transcripts by semester, calculates a dynamically weighted Grade Point Average (GPA), monitors accumulated ECTS credits, and tracks successfully completed courses.
* **Faculty Grading Ledger:** Empowers professors with a custom grade-management interface scoped exclusively to their assigned courses. Utilizes state-of-the-art database execution mechanics (`ON DUPLICATE KEY UPDATE`) to handle seamless single-view entry, submission, and instantaneous modification of student grade rosters.
* **Registrar & Administrative Orchestration Layer:** Centralized administration portal for university secretaries to manage organizational metadata. Provides granular management of the university's master course schedule, offering complete view sovereignty over unassigned/orphaned modules and multi-tenant professor-to-course load balancing via advanced relational `LEFT JOIN` structures.

---

### 🛠️ Enterprise Technology Stack

**Backend Framework & Spec Implementations**
<p align="left">
  <img src="https://img.shields.io/badge/Java_EE_/_Jakarta_EE-ED8B00?style=for-the-badge&logo=java&logoColor=white" alt="Java EE" />
  <img src="https://img.shields.io/badge/Java_Servlets_6.0-ED8B00?style=for-the-badge&logo=java" alt="Java Servlets" />
  <img src="https://img.shields.io/badge/JavaServer_Pages_(JSP)-ED8B00?style=for-the-badge" alt="JSP" />
</p>

**Web Infrastructure & Server Runtimes**
<p align="left">
  <img src="https://img.shields.io/badge/Apache_Tomcat_9+-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black" alt="Tomcat" />
</p>

**Relational Storage & Enterprise Connectivity**
<p align="left">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Java_Database_Connectivity_(JDBC)-4479A1?style=for-the-badge" alt="JDBC" />
</p>

**Client Presentation & Layout Engineering**
<p align="left">
  <img src="https://img.shields.io/badge/Bootstrap_5-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap" />
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5" />
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS" />
</p>

---

### 📸 Application Interface Showcase

<p align="center">
  <img src="Images/1.png" width="48%" />
  <img src="Images/2.png" width="48%" />
</p>
<p align="center">
  <img src="Images/3.png" width="48%" />
  <img src="Images/4.png" width="48%" />
</p>
<p align="center">
  <img src="Images/4.png" width="48%" />
  <img src="Images/5.png" width="48%" />
</p>
<p align="center">
  <img src="Images/6.png" width="48%" />
  <img src="Images/7.png" width="48%" />
</p>
<p align="center">
  <img src="Images/8.png" width="48%" />
  <img src="Images/9.png" width="48%" />
</p>

---

### 🚀 Enterprise Deployment Guide

**1. Infrastructure Prerequisites:**
* **Java JDK:** Ensure a production-compatible JDK (11 or higher) is configured in your global environment variables.
* **Server Runtime:** Download and install an instance of **Apache Tomcat (9.x / 10.x)** as your target servlet container.
* **Database Engine:** Verify that a **MySQL** database server instance is active and accessible.

**2. Database Schema Initialization:**
* Open your preferred database tool (e.g., MySQL Workbench).
* Execute the provided database structural script (`p23137_erg3_university.sql`) to generate the relational schemas, establish foreign key cascade constraints, and seed core system entities utilizing native SHA-256 data-hashing functions.

**3. Application Deployment & Build:**
* Clone or download the source repository and import the workspace folder structure directly into your Enterprise IDE (Eclipse IDE for Enterprise Java or IntelliJ IDEA).
* Review the resource parameters within the target `DatabaseConnection.java` utility class to ensure the connection string (`jdbc:mysql://localhost:3306/p23137_erg3_university`), database username, and user password credentials align precisely with your local environment.
* Perform an IDE project clean command, compile the artifacts into an enterprise web application archive file (`.war`), and mount it directly into your Tomcat instance's target server deployment paths.

---

### 🤝 Contribution & Contact

Contributions targeting the expansion of student data analytics modules, performance tuning of relational join queries, or modernizing the CSS layout engine are highly welcomed. Please feel free to open an issue tracker or submit an official, well-documented pull request.

**Inquiries:** [obrizanou@gmail.com](mailto:obrizanou@gmail.com)
