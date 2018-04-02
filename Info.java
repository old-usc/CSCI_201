package Game;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.*;

import com.google.gson.Gson;

import Game.Community;

public class Info extends Thread {
		//private BufferedReader br;
		//private PrintWriter pw;
		private ObjectInputStream ois;
		private ObjectOutputStream oos;
		private BufferedReader br;
		public Community community;
		private Gson gson;
		private String file;
		private ArrayList<Brawler> team = new ArrayList<Brawler>();
		 Scanner scan = new Scanner(System.in);
		public Info() {
					System.out.println("Please enter an IP address");
					String address = scan.nextLine();
					System.out.println("Please enter a port");
					int reg = -1;
					while (reg == -1) {
						try {
							String temp = scan.nextLine();
							int port = Integer.parseInt(temp);
							Socket s = new Socket(address, port);
							System.out.println("Please make a choice:");
							System.out.println("1) Start Game");
							System.out.println("2) Join Game");
							String on = scan.nextLine();
							int game = Integer.parseInt(on);
							
							if (game == 1) {
							
								System.out.println("What will you name your game?");
								String gameName = scan.nextLine();
								
								//check if its taken
								
								System.out.println("How many players?");
								System.out.println("1 or 2");
								String off = scan.nextLine();
								int players = Integer.parseInt(off);
							
								if (players == 2) {
									System.out.println("Waiting for players to connect...");
									//while the 2d vector says isnt full
									//empty loop
									System.out.println("Player 2 connected!");
									System.out.println("Starting game...");
								}
							}
							else if (game == 2) {
								
							}
							reg = 0;
						}
						catch (SocketTimeoutException exception) {
							System.out.println("Socket Timeout Exception");
						}
						catch (Exception e) {
							System.out.println("Unable to connect!");
						}
					}
				}
		public void run() {
			try {
			} catch (Exception e) {
				System.out.println("Something went wrong");
			}
		}
	
	
	
	
	
	
	
	public static void main(String argv[]) {
		Info info = new Info();
	}
}
