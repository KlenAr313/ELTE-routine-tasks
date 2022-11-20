using System;
using System.Collections.Generic;
using System.Linq;

namespace ritka
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] quantity = Console.ReadLine().Split();
            int n = Convert.ToInt32(quantity[0]);
            int k = Convert.ToInt32(quantity[1]);
            string[] data = Console.ReadLine().Split();
            int[] numbers = new int[n];

            for (int i = 0; i < n; i++)
            {
                numbers[i] = Convert.ToInt32(data[i]);
            }

            List<int> rare = new List<int>();
            List<int> notRare = new List<int>();

            for (int i = 0; i < k; i++)
            {
                if (!rare.Contains(numbers[i]) && !notRare.Contains(numbers[i]))
                {
                    rare.Add(numbers[i]);
                }
                else if (!notRare.Contains(numbers[i]))
                {
                    notRare.Add(numbers[i]);
                    rare.Remove(numbers[i]);
                }
            }

            bool contains;

            for (int i = k; i < n; i++)
            {
                if (!notRare.Contains(numbers[i]))
                {
                    contains = false;
                    for (int j = 1; j < k + 1; j++)
                    {
                        if (numbers[i - j] == numbers[i])
                        {
                            contains = true;
                            break;
                        }
                    }
                    if (contains)
                    {
                        notRare.Add(numbers[i]);
                    }
                }
            }

            for (int i = 0; i < notRare.Count; i++)
            {
                numbers = numbers.Where(val => val != notRare[i]).ToArray();
            }
            numbers = numbers.Distinct().ToArray();

            Console.WriteLine(numbers.Length);
            Array.Sort(numbers);
            for (int i = 0; i < numbers.Length; i++)
            {
                Console.Write(numbers[i] + " ");
            }

        }
    }
}