using System;
using System.Collections.Generic;

namespace Bor
{
    internal class Program
    {
        struct Ev
        {
            public int bor;
            public int ar;

            public Ev(string[] s)
            {
                bor = Convert.ToInt32(s[0]);
                ar = Convert.ToInt32(s[1]);
            }
        }

        static void Main(string[] args)
        {
            int n;
            string s;
            do
            {
                 s = Console.ReadLine();
            } while (int.TryParse(s, out n));

            Ev[] evek = new Ev[n]; 
            for (int i = 0; i < n; i++)
            {
                evek[i] = new Ev(Console.ReadLine().Split());
            }

            int[] Y = new int[n];
            Console.WriteLine(minBor(evek));
            Console.WriteLine(maxAr(evek));
            Console.WriteLine(arak(evek));
            Console.Write(moreThenEver(evek, Y));
            int s;
            for (int i = 0; i < moreThenEver(evek, Y); i++)
            {
                s = Y[i] + 1;
                Console.Write(" " + s);
            }
            Console.WriteLine();
        }

       static int minBor(Ev[] evek)
       {
            int mini = 0;
            for (int i = 1; i < evek.Length; i++)
            {
                if (evek[i].bor < evek[mini].bor)
                {
                    mini = i;
                }
            }
            return mini + 1;
       }

        static int maxAr(Ev[] evek)
        {
            int maxar = -1;
            for (int i = 0; i < evek.Length; i++)
            {
                if (evek[i].bor > 1000 && evek[i].ar > maxar)
                {
                    maxar = evek[i].ar;
                }
            }
            return maxar;
        }

        static int arak(Ev[] evek)
        {
            List<int> arak = new List<int>();
            for (int i = 0; i < evek.Length; i++)
            {
                if (!arak.Contains(evek[i].ar))
                {
                    arak.Add(evek[i].ar);
                }
            }
            return arak.Count;
        }

        static int moreThenEver(Ev[] evek, int[] Y)
        {
            int locMaxDb = 0;
            for (int i = 1; i < evek.Length; i++)
            {
                int j = 0;
                while (j < i && evek[i].bor > evek[j].bor)
                {
                    j++;
                }
                if (j >= i)
                {
                    Y[locMaxDb] = i;
                    locMaxDb++;
                }
            }
            return locMaxDb;
        }
    }
}