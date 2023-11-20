package Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerOperations {
    private Connection conn;
    public ManagerOperations(Connection con){
        this.conn=con;
    }
    public ManagerDetails getManagerDetailsbyEmail(String email,String password) {
        String q = "select * from staff where email=? AND password=?";
        ManagerDetails md = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                md = new ManagerDetails();
                md.setId(rs.getInt("id"));
                md.setName(rs.getString("name"));
                md.setAge(rs.getInt("age"));
                md.setGender(rs.getString("gender"));
                md.setAddress(rs.getString("address"));
                md.setEmail(rs.getString("email"));
                md.setPassword(rs.getString("password"));
                md.setPhone(rs.getString("pnumber"));
                md.setSalary(rs.getInt("salary"));
                md.setDesignation(rs.getString("designation"));
                md.getDateofjoining(rs.getDate("dateofjoining"));
                md.setType(rs.getInt("type"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return md;
    }
    public void updateDetails(String name,String address,String phone,int iod) throws SQLException {
        String q = "update staff set name=?,address=?,pnumber=? where id=?";
        PreparedStatement pstmt = conn.prepareStatement(q);
        pstmt.setString(1,name);
        pstmt.setString(2,address);
        pstmt.setString(3,phone);
        pstmt.setInt(4,iod);
        pstmt.executeUpdate();

    }
}