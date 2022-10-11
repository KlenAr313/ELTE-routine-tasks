using System;

namespace BlackJack
{
    internal class Program
    {
        static void Main(string[] args)
        {
            char[] cards = { 'a', 'f', 'k', '7', '8', '9', '0', 'A' };
            int[] value = { 2, 3, 4, 7, 8, 9, 10, 11 };

            bool noMore = false;
            int sum = 0;
            while (sum < 21 && !noMore)
            {
                char card;
                do
                {
                    Console.Write("Kérem a kártyát: ");
                    string help = Console.ReadLine();
                    if (help.Count() == 0)
                    {
                        card = 'l';
                        noMore = true;
                    }
                    else if (help.Count() != 1)
                    {
                        card = 'l';
                        Console.Write("Balfasz, ");
                    }
                    else card = Convert.ToChar(help);
                } while (!noMore && !cards.Contains(card));

                if (!noMore)
                {
                    int j = 0;
                    while (cards[j] != card)
                    {
                        j++;
                    }

                    
                    sum += value[j];
                    Console.WriteLine($"A kártya értéke: {value[j]}");
                    Console.WriteLine($"Az eddig összesen: {sum}");
                }
            } 
            if ( sum < 21)

            if (sum == 21)
            {
                Console.WriteLine("Gratulálok nyertél");
            }
            else if ( sum < 21)
            {
                Random R = new Random();
                sum += value[R.Next(0, 9)];
                Console.WriteLine($"{sum} még nem elég");
            }
            else
            {
                Console.WriteLine($"{sum} túl sok, vesztettél");
            }
        }
    }
}