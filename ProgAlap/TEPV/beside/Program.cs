using System;

namespace beside
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n = Convert.ToInt32(Console.ReadLine());

            string[] data = Console.ReadLine().Split();
            int[] less = new int[100000];
            int lessI = 0;
            int[] more = new int[100000];
            int moreI = 0;
            int first = Convert.ToInt32(data[0]);
            int lastLess = 0;
            int lastMore = 100000;

            int current;
            for (int i = 1; i < n; i++)
            {
                current = Convert.ToInt32(data[i]);
                if (current < first && current >= lastLess)
                {
                    less[lessI] = i;
                    lessI++;
                    lastLess = current;
                }
                else if (current > first && current <= lastMore)
                {
                    more[moreI] = i;
                    moreI++;
                    lastMore = current;
                }
            }

            Array.Resize(ref less, lessI);
            Array.Resize(ref more, moreI);

            Array.Sort(less);
            Array.Sort(more);
            Console.WriteLine(moreI);
            for (int i = 0; i < moreI; i++)
            {
                Console.Write("{0} ", more[i] + 1);
            }
            Console.WriteLine("\n{0}", lessI);
            for (int i = 0; i < lessI; i++)
            {
                Console.Write("{0} ", less[i] + 1);
            }   
        }
    }
}