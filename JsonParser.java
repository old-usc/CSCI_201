package Diner;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class JsonParser {

@SerializedName("Menu")
@Expose
private Menu menu;
@SerializedName("Customers")
@Expose
private List<Customer> customers = null;

public Menu getMenu() {
return menu;
}

public void setMenu(Menu menu) {
this.menu = menu;
}

public JsonParser withMenu(Menu menu) {
this.menu = menu;
return this;
}

public List<Customer> getCustomers() {
return customers;
}

public void setCustomers(List<Customer> customers) {
this.customers = customers;
}

public JsonParser withCustomers(List<Customer> customers) {
this.customers = customers;
return this;
}

}
