namespace FerefiNo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int N = int.Parse(Console.ReadLine());
            string[] szemszam = new string[N];
            int i;
            for (i = 0; i < N; i++)
            {
                szemszam[i] = Console.ReadLine();
            }

            i = 0;
            while (i < N && (szemszam[i][0] != '1' && szemszam[i][0] != '3'))
            {
                i++;
            }

            if (i < N)
            {
                Console.WriteLine("Van");
            }
            else
            {
                Console.WriteLine("Nincs");
            }

            i = 0;
            while (i < N && szemszam[i][0] != '4')
            {
                i++;
            }

            Console.WriteLine(i+1);
        }
    }
}