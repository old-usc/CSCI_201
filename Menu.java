package Diner;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Menu {

@SerializedName("deep fryer")
@Expose
private List<String> deepFryer = null;
@SerializedName("grill")
@Expose
private List<String> grill = null;
@SerializedName("milkshake maker")
@Expose
private List<String> milkshakeMaker = null;
@SerializedName("drink machine")
@Expose
private List<String> drinkMachine = null;

public List<String> getDeepFryer() {
return deepFryer;
}

public void setDeepFryer(List<String> deepFryer) {
this.deepFryer = deepFryer;
}

public Menu withDeepFryer(List<String> deepFryer) {
this.deepFryer = deepFryer;
return this;
}

public List<String> getGrill() {
return grill;
}

public void setGrill(List<String> grill) {
this.grill = grill;
}

public Menu withGrill(List<String> grill) {
this.grill = grill;
return this;
}

public List<String> getMilkshakeMaker() {
return milkshakeMaker;
}

public void setMilkshakeMaker(List<String> milkshakeMaker) {
this.milkshakeMaker = milkshakeMaker;
}

public Menu withMilkshakeMaker(List<String> milkshakeMaker) {
this.milkshakeMaker = milkshakeMaker;
return this;
}

public List<String> getDrinkMachine() {
return drinkMachine;
}

public void setDrinkMachine(List<String> drinkMachine) {
this.drinkMachine = drinkMachine;
}

public Menu withDrinkMachine(List<String> drinkMachine) {
this.drinkMachine = drinkMachine;
return this;
}

}
