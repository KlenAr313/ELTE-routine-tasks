using System;

namespace hot
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] s = Console.ReadLine().Split();
            int N = Convert.ToInt32(s[0]);
            int M = Convert.ToInt32(s[1]);

            int[,] ho = new int[N, M];
            for (int i = 0; i < N; i++)
            {
                string[] line = Console.ReadLine().Split(); 
                for (int j = 0; j < M; j++)
                {
                    ho[i, j] = Convert.ToInt32(line[j]);
                }
            }

            int[] meleg = new int[N];

            int Db = calculate(N, M, meleg, ho);

            Console.Write(Db);
            for (int i = 0; i < Db; i++)
            {
                Console.Write(" " + (meleg[i] + 1));
            }
            Console.WriteLine();
        }

        public static int calculate(int N, int M, int[] meleg, int[,] ho)
        {
            int Db = 0;
            for (int i = 0; i < N; i++)
            {
                int j = 0;
                while (j < M && !(ho[i, j] <= 0))
                {
                    j++;
                }
                if (!(j < M))
                {
                    meleg[Db] = i;
                    Db++;
                }
            }
            return Db;
        }
    }
}