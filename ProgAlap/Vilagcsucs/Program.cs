using System;

namespace Vilagcsucs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int length = Convert.ToInt32(Console.ReadLine());
            int[] prev = new int[2];
            string[] s = Console.ReadLine().Split();
            prev[0] = Convert.ToInt32(s[0]);
            prev[1] = Convert.ToInt32(s[1]);

            int curMax = 1;
            int fulMax = 1;

            int[] cur = new int[2];

            for (int i = 1; i < length; i++)
            {
                s = Console.ReadLine().Split();
                cur[0] = Convert.ToInt32(s[0]);
                cur[1] = Convert.ToInt32(s[1]);

                if (prev[0] == cur[0])
                {
                    if (prev[1] < cur[1])
                    {
                        curMax++;
                    }
                }
                else
                {
                    if (curMax > fulMax)
                    {
                        fulMax = curMax;
                    }
                    curMax = 0;
                    if (prev[1] < cur[1])
                    {
                        curMax++;
                    }
                }
                prev[0] = cur[0];
                prev[1] = cur[1];
            }

            Console.WriteLine(fulMax);
        }
    }
}