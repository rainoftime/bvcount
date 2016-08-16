package multirun.adaptive;

import gov.nasa.jpf.symbc.Debug;
import sidechannel.multirun.Observable;

/**
 *
 * @author Quoc-Sang Phan <sang.phan@sv.cmu.edu>
 *
 */
public class Example3Adaptive {
	
	static int run;
	static int[] prevObs;
	static int[] prevLow;
	
	public static int foo(int h, int l)
	{
		int cost;
		Debug.assume(l < 3);
		if (l == 0) {
			if (h < 2)
				cost = 1;
			else
				cost = 2;
		} else if (l == 1) {
			if (h < 3)
				cost = 3;
			else
				cost = 4;
		} else {// l==2
			if (h < 4)
				cost = 5;
			else
				cost = 6;
		}
		return cost;
	}

	public static void testGreedyAdaptive() {

		int h;
		int[] l = new int[run];

		int[] obs = new int[run];

		int i;

		if (run > 1) {
			for (int j = 0; j < run - 1; j++) {
				l[j] = prevLow[j];
			}
		}

		h = Debug.makeSymbolicInteger("h");

		// format lx_y: x is the index of the run, y is the index of the element
		// since the input is not an array, the index is always 0
		// this fits with the parser in the GreedyQuantifier

		// l[0] = 13;
		l[run - 1] = Debug.makeSymbolicInteger("l" + (run - 1) + "_0");
		for (i = 0; i < run - 1; i++){
			Debug.assume(l[run - 1] != l[i]);
		}
		// manually set l0
		l[0] = 1;

		// self-composition
		for (i = 0; i < run; i++) {
			obs[i] = foo(h, l[i]);
			if(i < run - 1){
				Debug.assume(obs[i] == prevObs[i]);
			}
			Observable.add(obs[i]);
		}

	}
	
	public static void main(String[] args) {

		if (args.length < 1) {
			System.out.println("Need number of runs");
			System.exit(0);
		}

		run = Integer.parseInt(args[0]); // number of runs
		
		if (run > 1){
			prevObs = new int[run - 1];
			prevLow = new int[run - 1];
			if (args.length < 2){
				System.out.println("Need input and output from the previous runs");
				System.exit(0);
			}
			// At this point, there are two arguments
			String strLine = args[1];
			// Read File Line By Line
			try {
				String[] token = strLine.split("@");
				// read the costs
				String[] costs = token[0].split(":");
				for (int i = 0; i < costs.length; i++){
					prevObs[i] = Integer.parseInt(costs[i]);
				}
				// read the input, in this program the low input is not an array
				String[] lowInputs = token[1].split("#");
				for (int i = 0; i < lowInputs.length; i++){
					prevLow[i] = Integer.parseInt(lowInputs[i]);
				}
			} catch (NumberFormatException e) {
				System.out.println(">>>>> This is not number >>>>>" + strLine.trim() + "<<<<<");
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		testGreedyAdaptive();
	}
	
}
