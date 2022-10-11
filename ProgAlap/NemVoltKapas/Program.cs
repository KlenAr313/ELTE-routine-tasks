using System;

namespace NemVoltKapas
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int N;
            N = int.Parse(Console.ReadLine());

            int[] H = new int[N];

            for (int i = 0; i < N; i++)
            {
                H[i] = Int32.Parse(Console.ReadLine());
            }

            int j = 0;

            while (j < N && H[j] != 0)
            {
                ++j;
            }

            if ( N == j)
            {
                Console.WriteLine("-1");
            }
            else
            {
                Console.WriteLine(j+1);
            }
        }
    }
}