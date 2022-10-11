using System;

namespace Versenypárok
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int egy;
            egy = int.Parse(Console.ReadLine());
            string egyM;
            egyM = Console.ReadLine();
            int ketto;
            ketto = int.Parse(Console.ReadLine());
            string kettoM;
            kettoM = Console.ReadLine();

            int egyP = 0, egyZ = 0, kettoP = 0, kettoZ = 0;

            for (int i = 0; i < egyM.Length; i++)
            {
                if (egyM[i] == 'p')
                {
                    egyP++;
                }
                else
                {
                    egyZ++;
                }
            }

            for (int i = 0; i < kettoM.Length; i++)
            {
                if (kettoM[i] == 'p')
                {
                    kettoP++;
                }
                else
                {
                    kettoZ++;
                }
            }

            int össz = 0;

            if (kettoP <= egyZ)
            {
                össz += kettoP;
            }
            else
            {
                össz += egyZ;
            }

            if (kettoZ <= egyP)
            {
                össz += kettoZ;
            }
            else
            {
                össz += egyP;
            }

            Console.WriteLine(össz);

        }
    }
}