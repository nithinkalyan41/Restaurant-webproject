package Entity;

import java.sql.Timestamp;

public class StaffDetails {
             private int id;
            private  String name;
            private  int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    private int salary;
    private String designation;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    private Timestamp dateofjoining;
    private int type;

    public StaffDetails(String name,int age, String gender, String address, String email, String password,String phone,int salary, String designation, Timestamp dateofjoining) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.password = password;
        this.phone=phone;
        this.salary = salary;
        this.designation = designation;
        this.dateofjoining = dateofjoining;
    }
    public StaffDetails(){

    }



    public StaffDetails(String name, int age, String gender, String address, String email, String password,String phone, int salary, String designation) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.salary = salary;
        this.designation = designation;
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

    public Timestamp getDateofjoining() {
        return dateofjoining;
    }

    public void setDateofjoining(Timestamp dateofjoining) {
        this.dateofjoining = dateofjoining;
    }

}
