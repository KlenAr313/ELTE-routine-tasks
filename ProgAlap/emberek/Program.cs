using System;
using System.Collections.Generic;

namespace emberek
{
    internal class Program
    {
        public struct ember_t
        {
            public int kor;
            public int fiz;

            public ember_t(string sor)
            {
                string[] s = sor.Split();
                this.kor = int.Parse(s[0]);
                this.fiz = int.Parse(s[1]);
            }

            public bool csoro()
            {
                return kor > 40 && fiz < 200000 ? true : false;
            }
        }

        static void Main(string[] args)
        {
            int N = Convert.ToInt32(Console.ReadLine());
            ember_t[] emberek = new ember_t[N]; 
            for (int i = 0; i < N; i++)
            {
                emberek[i] = new ember_t(Console.ReadLine());
            }

            Console.WriteLine(maxKor(emberek, N));
            Console.WriteLine(csorokDb(emberek, N));
            Console.WriteLine(korok(emberek, N));
            Console.Write((fiatalok(emberek, N)).Count + " ");
            List<int> indexes = fiatalok(emberek, N); 
            for (int i = 0; i < indexes.Count; i++)
            {
                Console.Write(indexes[i]+1 + " ");
            }
            Console.WriteLine();
            
        }

        public static int maxKor(ember_t[] emberek, int N)
        {
            int maxInd = 0;
            for (int i = 1; i < N; i++)
            {
                if (emberek[i].kor > emberek[maxInd].kor)
                {
                    maxInd=i;
                }
            }
            return maxInd + 1;
        }

        public static int csorokDb(ember_t[] emberek, int N)
        {
            int megszNegy = 0;
            for (int i = 0; i < N; i++)
            {
                if (emberek[i].csoro())
                {
                    megszNegy++;
                }
            }
            return megszNegy;
        }

        public static int korok(ember_t[] emberek, int N)
        {
            int korDb = 1;
            for (int i = 1; i < N; i++)
            {
                int j = 0;
                while (j < i && emberek[i].kor != emberek[j].kor)
                {
                    j++;
                }
                if (j >= i)
                {
                    korDb++;
                }
            }
            return korDb;
        }

        public static List<int> fiatalok(ember_t[] emberek, int N)
        {
            List<int> Y = new List<int>();
            for (int i = 0; i < N; i++)
            {
                if (emberek[i].kor< 30)
                {
                    Y.Add(i);
                }
            }
            return Y;
        }
    }
}