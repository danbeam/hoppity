import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

class hoppity {

    public static void main (String args[]) {

        boolean DEBUG = false;

        if (args.length <= 0) {
            System.err.println("You need to specify a filename!");
            System.err.println("USAGE: java hoppity <filename>");
            System.exit(1);
        }

        if (DEBUG) {
            System.out.println("Trying to open " + args[0]);
        }

        File in_file = new File(args[0]);

        if (!in_file.exists()) {
            System.err.println("That file doesn't exist!");
            System.exit(1);
        }
        else if (!in_file.canRead()) {
            System.err.println("That file isn't readable!");
            System.exit(1);
        }

        try {

            String line = "";
            int to_count = -1;
            BufferedReader buffer = new BufferedReader(new FileReader(in_file));

            do {
                line = buffer.readLine().trim();
                if (!line.equals("")) {
                    to_count = Integer.parseInt(line.trim(), 10);
                }
            }
            while (to_count < 0);

            if (DEBUG) {
                System.out.println("Got value of " + to_count + " from file.");
            }

            for (int i = 1; i <= to_count; ++i) {
                if (0 == i % 15) {
                    System.out.println("Hop");
                }
                else if (0 == i % 3) {
                    System.out.println("Hoppity");
                }
                else if (0 == i % 5) {
                    System.out.println("Hophop");
                }
            }

        }
        catch (IOException ioe) {
            System.err.println("There was an error reading your file!");
            System.exit(1);
        }

    }

}
