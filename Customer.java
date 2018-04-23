package Diner;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Customer {

@SerializedName("order")
@Expose
private List<String> order = null;

public List<String> getOrder() {
return order;
}

public void setOrder(List<String> order) {
this.order = order;
}

public Customer withOrder(List<String> order) {
this.order = order;
return this;
}

}
