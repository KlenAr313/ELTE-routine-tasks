using System;

namespace kecske
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n = Convert.ToInt32(Console.ReadLine());
            int[] w = new int[n];
            int[] b = new int[n];
            string[] data = Console.ReadLine().Split();
            int cw = 0;
            int cb = 0;
            for (int i = 0; i < n * 2; i++)
            {
                if (data[i] == "0")
                {
                    w[cw] = i;
                    cw++;
                }
                else
                {
                    b[cb] = i;
                    cb++;
                }
            }

            int sum = 0;

            for (int i = 0; i < n; i++)
            {
                sum += Math.Abs(w[i] - b[i]);
            }
            Console.WriteLine(sum);
        }
    }
}