package utility;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

public class demou {

	// Function to return majority element present in given array
		public static int majorityElement(int A[])
		{
			// get array length
			int n = A.length;

			// create an empty Hash Map
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		 
			// 1. store each element's frequency in a map
			for (int i = 0; i < n; i++)
			{
				if (map.get(A[i]) == null)
					map.put(A[i], 0);
				
				map.put(A[i], map.get(A[i]) + 1);
			}

			
			System.out.println(n);
			System.out.println(map);
			
			// 2. return the element if its count is more than n/2
			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) 
			{
				Map.Entry pair = (Map.Entry)it.next();
				if ((int)pair.getValue() > n/2)
					return (int)pair.getKey();

				it.remove(); // avoids ConcurrentModification Exception
			}

			// no majority element is present
			return -1;
		}

		public static void main (String[] args)
		{
			// Assumtion - valid input (majority element is present)
			int arr[] = { 1,1,2,2,2,2,3,3,3,3,3,3,3 };

			int ret = majorityElement(arr);
			if (ret != -1)
				System.out.println("Majority element is " + ret);
			else
				System.out.println("Majority element does not exist");
		}
	}