package Game;

import java.util.ArrayList;

public class Brawler {
	public String name;
	public String type;
	public ArrayList<String> stats;
	public ArrayList<Abilities> abilities;
	
	public Brawler(String name, String type) {
		this.name = name;
		this.type = type;
	}
	
	public String getName() {
		return name;
	}
	
	public String getType() {
		return type;
	}
	
	public ArrayList<String> getStats() {
		return stats;
	}
	public ArrayList<Abilities> getAbilities() {
		return abilities;
	}
}