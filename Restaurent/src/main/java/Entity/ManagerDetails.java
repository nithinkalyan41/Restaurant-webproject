package Entity;

import java.sql.Date;
import java.sql.Timestamp;

public class ManagerDetails {
    private int id;
    private  String name;
    private  int age;
    private String gender;
    private String address;
    private String email;
    private String password;
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Timestamp getDateofjoining() {
        return dateofjoining;
    }

    public int getType() {
        return type;
    }

    private int salary;
    private String designation;
    private Timestamp dateofjoining;
    private int type;
    public ManagerDetails(){

    }

    public int getType(int type) {
        return this.type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Timestamp getDateofjoining(Date dateofjoining) {
        return this.dateofjoining;
    }

    public void setDateofjoining(Timestamp dateofjoining) {
        this.dateofjoining = dateofjoining;
    }
}
