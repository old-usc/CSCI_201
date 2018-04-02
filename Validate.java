package Game;


import java.io.*;
 import java.net.*;
import java.util.*;

import com.google.gson.Gson;

import Game.Community;

 public class Validate {
 private int sessionNo = 1; // Number a session
 private BufferedReader br;
 BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
 public Community community;
 private Gson gson;
 private String file;
 private ArrayList<Brawler> team = new ArrayList<Brawler>();
 private String address;
 private int create;
 private String gameName;
 private int players;
 Scanner scan = new Scanner(System.in);
 
	private Vector<ServerThread> serverThreads;
	public Validate() throws FileNotFoundException {	
		serverThreads = new Vector<ServerThread>();
			System.out.println("Please enter a valid JSON");
			String json = scan.nextLine();
			Validate val = new Validate();
		 	file = "/Users/Zach/Documents/workspace/CSCI201_Assignment4/WebContent/" + json;
		 	br = new BufferedReader(new FileReader(file));
			val.gson = new Gson();
			val.community = val.gson.fromJson(br, Community.class);
			
			System.out.println("Please enter a valid port");
			int reg = -1;
			while (reg == -1) {
				try {
					String temp = scan.nextLine();
					int port = Integer.parseInt(temp);
					ServerSocket ss = new ServerSocket(port);
					reg = 0;
					System.out.println("Success!");
					
					int cap = 0;
					while(cap < 2) {
						Socket s = ss.accept(); // blocking
						cap++;
						
						System.out.println("Connection from: " + s.getInetAddress());
						ServerThread st = new ServerThread(s, this);
						serverThreads.add(st);
					}
				}
				catch (Exception e) {
					System.out.println("Invalid Port!");
				}
			}

	}
	
	public static void main(String [] args) throws FileNotFoundException {
		Validate val = new Validate();
	}
}