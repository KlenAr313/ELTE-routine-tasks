using System;
using System.Collections.Generic;

namespace flags
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] s = Console.ReadLine().Split();
            int n = Convert.ToInt32(s[0]);
            int k = Convert.ToInt32(s[2]);
            Dictionary<string, int> napok = new Dictionary<string, int>();
            string[] inPut = Console.ReadLine().Split();
            int i = 0;

            for (i = 0; i < k; i++)
            {
                if (inPut[i][0] != '0')
                {
                    if (napok.ContainsKey(inPut[i]))
                    {
                        napok[inPut[i]]++;
                    }
                    else
                    {
                        napok.Add(inPut[i], 1);
                    }
                }
            }

            int bestI = 0;
            int best = napok.Count;
            int cur;

            for (i = k; i < n; i++)
            {
                if (inPut[i][0] != '0')
                {
                    if (napok.ContainsKey(inPut[i]))
                    {
                        napok[inPut[i]]++;
                    }
                    else
                    {
                        napok.Add(inPut[i], 1);
                    }
                }

                if (inPut[i-k][0] != '0')
                {
                    napok[inPut[i - k]]--;
                    if (napok[inPut[i - k]] == 0)
                    {
                        napok.Remove(inPut[i - k]);
                    }
                }

                cur = napok.Count;
                if (cur > best)
                {
                    best = cur;
                    bestI = i - k + 1;
                }
            }

            Console.WriteLine(bestI + 1);
        }
    }
}