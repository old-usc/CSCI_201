package Game;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;

import Game.Community;

public class ServerThread extends Thread {

	//private PrintWriter pw;
	//private BufferedReader br;
	private ObjectOutputStream oos;
	private ObjectInputStream ois;
	private Validate bf;
	public ServerThread(Socket s, Validate bf) {
		try {
			this.bf = bf;
			//pw = new PrintWriter(s.getOutputStream());
			//br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			oos = new ObjectOutputStream(s.getOutputStream());
			ois = new ObjectInputStream(s.getInputStream());
			this.start();
		} catch (IOException ioe) {
			System.out.println("ioe in ServerThread constructor: " + ioe.getMessage());
		}
	}
	public void run() {
		try {
		}
		catch (Exception e) {
			System.out.println("Something went wrong");
		}
		}
	}