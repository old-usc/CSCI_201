package Diner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;


import com.google.gson.Gson;


public class Kitchen {
	private static Semaphore fryerSemaphore;
	private static Semaphore grillSemaphore;
	private static Semaphore milkshakeSemaphore;
	private static Semaphore drinkSemaphore;
	
	public JsonParser jp;
	private Gson gson;	
	
	
	public Kitchen() {
		fryerSemaphore = new Semaphore(4);
		grillSemaphore = new Semaphore(5);
		milkshakeSemaphore = new Semaphore(2);
		drinkSemaphore = new Semaphore(2);
	}
	
	
	
	
	public synchronized static void register(int id) {
		try {
			Thread.sleep(1500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public void deepFryer() {
		try {
			fryerSemaphore.acquire();
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		finally {
			fryerSemaphore.release();
		}
	}
	public void grill() {
		try {
			grillSemaphore.acquire();
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		finally {
			grillSemaphore.release();
		}
	}
	public void milkshakeMaker() {
		try {
			milkshakeSemaphore.acquire();
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		finally {
			milkshakeSemaphore.release();
		}
	}
	public void drinkMachine() {
		try {
			drinkSemaphore.acquire();
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		finally {
			drinkSemaphore.release();
		}
	}
	public int getCustomersSize() {
		return jp.getCustomers().size();
	}
	
	public List<String> getCustomerOrder(int i) {
		return jp.getCustomers().get(i).getOrder();
	}
	
	
	
	
	
	public static void main(String [] args) throws IOException {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Please enter a file.");
		String file = scanner.next();
		BufferedReader br;
		Kitchen k = new Kitchen();
		Menu m = new Menu();
		br = new BufferedReader(new FileReader(file));
		k.gson = new Gson();
		k.jp = k.gson.fromJson(br, JsonParser.class);
		//System.out.println("menu: " + m.getGrill().size());
		
		int size = k.getCustomersSize();
		ExecutorService executors = Executors.newCachedThreadPool();
		for (int i = 0; i < size; i++) {
			List<String> orders = k.getCustomerOrder(i);
			/*for (int j = 0; j < orders.size(); j++) {
				System.out.println("order " + j + ": " + orders.get(j));
			}*/
			k.register(i);
			Util.printMessage("startID: " + i);
			Order order = new Order(i, k, orders);
			
			executors.execute(order);
		}
		executors.shutdown();
	}
}
