using System;
namespace nagyfal
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n = Convert.ToInt32(Console.ReadLine());
            int[] data = new int[n];
            int[] datab = new int[n];
            int sum = 0;
            bool van = false;
            int first = 0;
            int max = 0;
            int e = 0, m = 0, maxe = 0, maxm = 0;
            bool kezd = true;
            int need = 0;

            for (int i = 0; i < n; i++)
            {
                data[i] = Convert.ToInt32(Console.ReadLine());
                if(i != 0 && (data[i-1] != 0 || data[i] != 0))
                {
                    sum++;
                }

                if (i != 0 && !van && (data[i] == 0 && data[i-1] == 0))
                {
                    first = (i);
                    van = true;
                }

                if (data[i] == 0)
                {
                    if(m - e > max)
                    {
                        max = m - e;
                        maxe = e;
                        maxm = m;
                    }
                    kezd = true;
                }
                else
                {
                    if (kezd)
                    {
                        e = m = i;
                        kezd = false;
                    }
                    else
                    {
                        m = i;
                    }
                }

                datab[i] = data[i];

                if (i != 0 && datab[i] == 0 && datab[i-1] == 0)
                {
                    need++;
                    datab[i] = 1;
                }
            }
            Console.WriteLine(sum);
            Console.WriteLine(need);
            Console.WriteLine(first);
            if (max == 0)
            {
                Console.WriteLine(0);
            }
            else
            {
                Console.WriteLine("{0} {1}", maxe + 1, maxm + 1);
            }
            
        }
    }
}