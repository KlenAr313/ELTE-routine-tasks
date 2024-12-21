using System;
using System.Linq;

namespace bead2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int napok = 0;
            napok = Convert.ToInt16(Console.ReadLine());
            int[,] input = new int[napok,2];
            int[] output = new int[100];
            int i;


            for (i = 0; i < napok; i++)
            {
                string[] seged = Console.ReadLine().Split(' ');
                input[i,0] = Convert.ToInt32(seged[0]);     
                input[i,1] = Convert.ToInt32(seged[1]);     
            }

            int db = 0;
            for (i = 0; i < napok; i++)
            {
                if (input[i,0] < 0 && input[i,1] >=0)
                {
                    output[db] = i + 1;
                    db++;
                }
            }

            Console.Write(db + " ");
            for (i = 0; i < db; i++)
            {
                Console.Write(output[i] + " ");
            }
        }
    }
}