using System;

namespace neighbor
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] s = Console.ReadLine().Split();
            int n = Convert.ToInt32(s[0]);
            int k = Convert.ToInt32(s[1]);

            

            string[] data = Console.ReadLine().Split();
            int[] numbers = new int[k + 1];
            int?[] distance = new int?[k + 1]; // min distance

            for (int i = 0; i < k + 1; i++)
            {
                numbers[i] = -1;
                distance[i] = null;
            }

            int cur;
            int dis;

            for (int i = 0; i < n; i++)
            {
                cur = Convert.ToInt32(data[i]);

                if (numbers[cur] == -1)
                {
                    numbers[cur] = i;
                }
                else
                {
                    dis = i - numbers[cur];
                    if (distance[cur] == null)
                    {
                        distance[cur] = dis;
                    }
                    else if (dis < distance[cur])
                    {
                        distance[cur] = dis;
                    }

                    numbers[cur] = i;
                }
            }

            int sol = 0;

            for (int i = 1; i < k + 1; i++)
            {
                int? asd = distance[sol] == null ? 0 : distance[sol];
                if (distance[i] != null &&  distance[i] > asd)
                {
                    sol = i;
                }
            }

            if (sol == 0)
            {
                Console.WriteLine(-1);
            }
            else
            {
                Console.WriteLine(sol);
            }
        }
    }
}