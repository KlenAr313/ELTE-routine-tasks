using System.Linq.Expressions;

namespace Allatkert
{
    internal class Program
    {
        public struct Ter
        {
            public string nev { get; set; }
            public int db { get; set; }
            public string[] allatok { get; set; }

            public Ter(string nev, int db, string[] allatok)
            {
                this.nev = nev;
                this.db = db;
                this.allatok = allatok;
            }
        }


        static void Main(string[] args)
        {
            int leng = 0;
            Ter[] ters;
            bool good = false;
            do
            {
                string l;
                do
                {
                    Console.Write("Kérem a területek mennyiségét: ");
                    l = Console.ReadLine();
                } while (!int.TryParse(l, out leng));

                ters = new Ter[leng];
                for (int i = 0; i < leng; i++)
                {
                    string nev;   
                    bool diget = false;
                    do
                    {
                        Console.Write($"#{i + 1} neve: ");
                        nev = Console.ReadLine();
                        for (int j = 0; j < nev.Length; j++)
                        {
                            diget = char.IsDigit(nev[j]);
                        }
                        nev.Trim();
                    } while (diget || nev == null || nev.Length == 0 );

                    l = "";
                    int db;
                    do
                    {
                        Console.Write($"#{1+i} db: ");
                        l = Console.ReadLine();
                    } while (!int.TryParse(l, out db));


                    string[] allatok;
                    diget = false;
                    do
                    {
                        Console.Write($"#{i + 1} állatok pontosvesszővel (;) elválasztva: ");
                        allatok = Console.ReadLine().Split(';');
                        for (int k = 0; k < allatok.Length; k++)
                        {
                            allatok[k].Trim();
                            for (int j = 0; j < allatok[k].Length; j++)
                            {
                                diget = char.IsDigit(allatok[k][j]);
                            }
                            diget = allatok[k] == null || allatok[k].Length == 0;
                        }
                    } while (diget || allatok.Length != db);


                    ters[i] = new Ter(nev, db, allatok);
                }

                for (int i = 0; i < leng; i++)
                {
                    if (VanBenne(ters[i], "kacsa"))
                    {
                        good = true;
                    }
                }
                if (!good)
                {
                    Console.WriteLine("Nem volt benne kacsa!");
                }
            } while (!good);

            Ossz(ters, leng);
            Majom(ters, leng);
            Kacsa(ters, leng);

        }

        public static bool VanBenne(Ter ter, string allat)
        {
            if (ter.allatok.Contains(allat))
                return true;
            return false;
        }

        public static void Ossz(Ter[] ters, int leng)
        {
            int ossz = 0;
            for (int i = 0; i < leng; i++)
            {
                ossz += ters[i].db;
            }
            Console.WriteLine(ossz);
        }

        public static void Majom(Ter[] ters, int leng)
        {
            int ossz = 0;
            for (int i = 0; i < leng; i++)
            {
                ossz += VanBenne(ters[i], "majom") ? 1 : 0;
            }
            Console.WriteLine(ossz);
        }

        public static void Kacsa(Ter[] ters, int leng)
        {
            for (int i = 0; i < leng; i++)
            {
                if (VanBenne(ters[i],"kacsa"))
                {
                    Console.WriteLine(ters[i].nev);
                    return;
                }
            }
            throw new Exception("Dehát azt mondtátok, hogy van benne kacsa!!!!");
        }
    }
}