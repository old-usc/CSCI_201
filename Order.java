package Diner;

import java.util.List;


public class Order extends Thread {
	private Kitchen k;
	private int id;
	private List<String> ord;
	private Menu m = new Menu();
	
	public Order() {
	}
	
	public Order(int id, Kitchen k, List<String> ord) {
		this.id = id;
		this.k = k;
		this.ord = ord;
	}
	
	public long getId() {
		return this.id;
	}
	
	
	public boolean kitchen(List<String> o, int id, List<String> tempOrder) {

			for (int j = 0; j < k.jp.getMenu().getDeepFryer().size(); j++) {

					for (int i = 0; i < tempOrder.size(); i++) {
					//System.out.println("First: " + tempOrder.get(i) + ", Second " + k.jp.getMenu().getDeepFryer().get(j));
					if (tempOrder.get(i).equals(k.jp.getMenu().getDeepFryer().get(j))) {
						tempOrder.remove(i);
						i--;
						k.deepFryer();
						if (tempOrder.size() == 0) {
							return true;
						}
					}
				}
			}
			for (int j = 0; j < k.jp.getMenu().getGrill().size(); j++) {
				for (int i = 0; i < tempOrder.size(); i++) {
					//System.out.println("First: " + tempOrder.get(i) + ", Second " + k.jp.getMenu().getGrill().get(j));
					if (tempOrder.get(i).equals(k.jp.getMenu().getGrill().get(j))) {
						tempOrder.remove(i);
							i--;
						k.grill();
						if (tempOrder.size() == 0) {
							return true;
						}
					}
				}
			}
			for (int j = 0; j < k.jp.getMenu().getMilkshakeMaker().size(); j++) {
				for (int i = 0; i < tempOrder.size(); i++) {
					//System.out.println("First: " + tempOrder.get(i) + ", Second " + k.jp.getMenu().getMilkshakeMaker().get(j));
					if (tempOrder.get(i).equals(k.jp.getMenu().getMilkshakeMaker().get(j))) {
						tempOrder.remove(i);
							i--;
						k.milkshakeMaker();
						if (tempOrder.size() == 0) {
							return true;
						}
					}
					
				}
			}
			for (int j = 0; j < k.jp.getMenu().getDrinkMachine().size(); j++) {
				for (int i = 0; i < tempOrder.size(); i++) {
					if (tempOrder.get(i).equals(k.jp.getMenu().getDrinkMachine().get(j))) {
						tempOrder.remove(i);
							i--;
						k.drinkMachine();
						if (tempOrder.size() == 0) {
							return true;
						}
					}
					
				}
			}
		
		if (tempOrder.size() == 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public synchronized void register() {
		try {
			Thread.sleep(1500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	
	public void run() {
		
		boolean finished = kitchen(this.ord, this.id, this.ord);
		if (finished == true) {
			Util.printMessage("endID: " + this.id);
			
		}
	}
}
