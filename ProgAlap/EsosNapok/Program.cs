using System;

namespace EsosNapok
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int N;
            N = int.Parse(Console.ReadLine());

            int j = 0;
            for (int i = 0; i < N; i++)
            {
                if( Int32.Parse(Console.ReadLine()) != 0)
                {
                    j++;
                }
            }

            Console.WriteLine(j);
        }
    }
}