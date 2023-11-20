package Entity;

public class ItemDetails {

    private int item_id;
    private String item_name;
    private int item_quantity;
    private String item_type;
    private float item_price;
    public ItemDetails(){

    }
    public ItemDetails(int item_id,String item_name, int item_quantity, String item_type, float item_price) {
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_quantity = item_quantity;
        this.item_type = item_type;
        this.item_price = item_price;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public int getItem_quantity() {
        return item_quantity;
    }

    public void setItem_quantity(int item_quantity) {
        this.item_quantity = item_quantity;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public float getItem_price() {
        return item_price;
    }

    public void setItem_price(float item_price) {
        this.item_price = item_price;
    }

    @Override
    public String toString() {
        return "ItemDetails{" +
                "item_id=" + item_id +
                ", item_name='" + item_name + '\'' +
                ", item_quantity=" + item_quantity +
                ", item_type='" + item_type + '\'' +
                ", item_price=" + item_price +
                '}';
    }
}
