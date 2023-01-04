using System;
using System.Collections.Generic;
using System.Linq;

namespace zh
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] str = Console.ReadLine().Split();
            int s = Convert.ToInt32(str[0]);
            int n = Convert.ToInt32(str[1]);
            int[] players = new int[s];
            int[,] pairs = new int[s + 1, s + 1];

            for (int i = 0; i < s + 1; i++)
            {
                for (int j = 0; j < s + 1; j++)
                {
                    pairs[i, j] = 0;
                }
            }

            Dictionary<string, int> many = new Dictionary<string, int>();
            Dictionary<string, List<int>> played = new Dictionary<string, List<int>>();

            for (int i = 0; i < n; i++)
            {
                string[] h = Console.ReadLine().Split();
                int ver = Convert.ToInt32(h[1]);

                if (played.ContainsKey(h[0]))
                {
                    played[h[0]].Add(ver);
                }
                else
                {
                    played.Add(h[0], new List<int>());
                    played[h[0]].Add(ver);
                }

                if (many.ContainsKey(h[0]))
                {
                    many[h[0]]++;
                }
                else
                {
                    many.Add(h[0], 1);
                }

                players[ver - 1]++;

                pairs[ver, 0] = 1;
            }

            string one = "";
            one = (many.First(a => a.Value == 1)).Key;

            Console.WriteLine("#");
            Console.WriteLine(one);

            string most = "";
            most = many.Aggregate((x, y) => x.Value > y.Value ? x : y).Key;
            Console.WriteLine("#");
            Console.WriteLine(most);

            Console.WriteLine("#");
            for (int i = 0; i < s; i++)
            {
                Console.Write(players[i] + " ");
            }
            Console.WriteLine("\n#");

            for (int i = 1; i < s + 1; i++)
            {
                if (pairs[i, 0] == 1)
                {
                    for (int j = i + 1; j < s + 1; j++)
                    {
                        if (pairs[j,0] == 1)
                        {
                            pairs[i,j] = 1;
                        }
                    }
                }
            }

            foreach (KeyValuePair<string, List<int>> item in played)
            {
                for (int i = 0; i < item.Value.Count; i++)
                {
                    for (int j = i + 1; j < item.Value.Count; j++)
                    {
                        pairs[item.Value[i], item.Value[j]] = 0;
                        pairs[item.Value[j], item.Value[i]] = 0;
                    }
                }
            }

            for (int i = 1; i < s + 1; i++)
            {
                for (int j = i + 1; j < s + 1; j++)
                {
                    if (pairs[i, j] == 1)
                    {
                        Console.WriteLine(i + " " + j);
                    }
                }
            }
            Console.WriteLine("#");
            foreach (KeyValuePair<string, List<int>> item in played)
            {
                int db = 0;
                bool asd = false;
                foreach (KeyValuePair<string, List<int>> sec in played)
                {
                    asd = false;
                    int i = 0;
                    for (i = 0; i < item.Value.Count; i++)
                    {
                        int j = 0;
                        for (j = 0; j < sec.Value.Count; j++)
                        {
                            if (sec.Value[j] == item.Value[i])
                            {
                                db++;
                                asd = true;
                                break;
                            }
                        }
                        if (asd)
                        {
                            break;
                        }
                    }
                }
                Console.WriteLine(item.Key + " " + (db - 1));
            }
        }
    }
}