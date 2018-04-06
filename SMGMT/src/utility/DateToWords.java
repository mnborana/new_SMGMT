package utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

/**
 * Write a program that accepts as input from the user the date in dd-mm-yyyy
 * format. The output should be the date in words. Sample input: Input date:
 * 04-04-1982 Output: Fourth of April, Nineteen Eighty Two
 *
 * @author Arun Kumar
 */
public class DateToWords {

    private static final String[] specialNamesMonthDay = {
        "",
        " first",
        " second",
        " third",
        " fourth",
        " fifth",
        " sixth",
        " seventh",
        " eighth",
        " nineth",
        " tenth",
        " eleventh",
        " twelveth",
        " thirteenth",
        " fourteenth",
        " fifteenth",
        " sixteenth",
        " seventeenth",
        " eighteenth",
        " nineteenth",
        " twenth",
        " twenty first",
        " twenty second",
        " twenty third",
        " twenty fourth",
        " twenty fifth",
        " twenty sixth",
        " twenty seventh",
        " twenty eighth",
        " twenty nineth",
        " thirty",
        " thirty first"

    };
    private static final String[] specialNames = {
        "",
        " thousand"

    };

    private static final String[] tensNames = {
        "",
        " ten",
        " twenty",
        " thirty",
        " forty",
        " fifty",
        " sixty",
        " seventy",
        " eighty",
        " ninety"
    };

    private static final String[] numNames = {
        "",
        " one",
        " two",
        " three",
        " four",
        " five",
        " six",
        " seven",
        " eight",
        " nine",
        " ten",
        " eleven",
        " twelve",
        " thirteen",
        " fourteen",
        " fifteen",
        " sixteen",
        " seventeen",
        " eighteen",
        " nineteen"
    };

    public DateToWords() {
        System.out.println("Pleaser date in dd-mm-yyyy format");
        Scanner in = new Scanner(System.in);
        String date = in.next();

        if (validateDate(date)) {

            SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
            ParsePosition parsePosition = new ParsePosition(0);
            Calendar cal = Calendar.getInstance();
            cal.setTime(dateFormatter.parse(date, new ParsePosition(0)));
            DateFormat format2 = new SimpleDateFormat("MMMMM ");

            int day = cal.get(Calendar.DATE);
            String strDateToWords = getMonthDay(day);
            strDateToWords += " of " + format2.format(cal.getTime());

            int year = cal.get(Calendar.YEAR);
            strDateToWords += " " + convert(year);

            System.out.println(strDateToWords.toLowerCase());
        } else {
            System.out.println("Wrongt! Please enter date in dd-mm-yyyy format");
        }
    }

    public String getMonthDay(int day) {
        return specialNamesMonthDay[day];
    }

    private String convertLessThanOneThousand(int number) {
        String current;

        if (number % 100 < 20) {
            current = numNames[number % 100];
            number /= 100;
        } else {
            current = numNames[number % 10];
            number /= 10;

            current = tensNames[number % 10] + current;
            number /= 10;
        }
        if (number == 0) {
            return current;
        }
        return numNames[number] + " hundred" + current;
    }

    public String convert(int number) {

        if (number == 0) {
            return "zero";
        }

        String prefix = "";

        String current = "";
        int place = 0;

        if (number >= 1 && number < 2000) {
            do {
                int n = number % 100;
                if (n != 0) {
                    String s = convertLessThanOneThousand(n);
                    current = s + current;
                }
                place++;
                number /= 100;
            } while (number > 0);
        } else {
            do {
                int n = number % 1000;
                if (n != 0) {
                    String s = convertLessThanOneThousand(n);
                    current = s + specialNames[place] + current;
                }
                place++;
                number /= 1000;
            } while (number > 0);
        }

        return (prefix + current).trim();
    }

    public boolean validateDate(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        try {
            sdf.setLenient(false);
            sdf.parse(date);
            return true;
        } catch (ParseException ex) {
            return false;
        }
    }

    public static void main(String[] args) {
        new DateToWords();

    }

}
