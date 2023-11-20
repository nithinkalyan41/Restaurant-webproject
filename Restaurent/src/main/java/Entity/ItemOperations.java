package Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemOperations {
    private Connection conn;
    public ItemOperations(Connection conn){
        this.conn=conn;
    }
    public boolean insertItem(ItemDetails item_details){
        boolean i = false;
        try{
            String q = "insert into foodtable(item_id,item_name,item_quantity,item_type,item_price) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(q);
            pstmt.setInt(1,item_details.getItem_id());
            pstmt.setString(2,item_details.getItem_name());
            pstmt.setInt(3,item_details.getItem_quantity());
            pstmt.setString(4,item_details.getItem_type());
            pstmt.setFloat(5,item_details.getItem_price());
            int k = pstmt.executeUpdate();
            if(k==1){
                i = true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return i;
    }
    public ItemDetails getItemById(int id) throws SQLException {
       String q = "SELECT * FROM foodtable WHERE item_id=?";
       PreparedStatement pstmt = this.conn.prepareStatement(q);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        ItemDetails it = new ItemDetails();
        while(rs.next()){
            it.setItem_id(rs.getInt("item_id"));
            it.setItem_name(rs.getString("item_name"));
            it.setItem_quantity(rs.getInt("item_quantity"));
            it.setItem_type(rs.getString("item_type"));
            it.setItem_price(rs.getFloat("item_price"));
        }
        return it;
    }

   /* public boolean updateItem(ItemDetails  itemDetails){

    }*/
   /* public boolean deleteItem(ItemDetails itemDetails){

    }*/

}
