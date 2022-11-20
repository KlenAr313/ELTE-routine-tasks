using System;

namespace idojaras
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] guantity = Console.ReadLine().Split();
            int n = Convert.ToInt32(guantity[0]);
            int k = Convert.ToInt32(guantity[1]);
            string[] daysInStr = Console.ReadLine().Split();
            int[] days = new int[n];

            for (int i = 0; i < n; i++)
            {
                days[i] = Convert.ToInt32(daysInStr[i]);
            }

            int index = 0;
            int value = 0;

            int currentValue;
            int curMax = days[0];
            int curMin = days[0];

            for (int i = 1; i < k; i++)
            {
                if (days[i] > curMax)
                {
                    curMax = days[i];
                }
                else if (days[i] < curMin)
                {
                    curMin = days[i];
                }
            }
            currentValue = curMax - curMin;
            value = currentValue;

            bool needMaxSearch;
            bool needMinSearch;

            for (int i = 1; i < n - k + 1; i++)
            {
                needMaxSearch = true;
                needMinSearch = true;
                if (days[i + k - 1] >= curMax)
                {
                    curMax = days[i + k - 1];
                    needMaxSearch = false;
                }
                else if (days[i + k - 1] <= curMin)
                {
                    curMin = days[i + k - 1];
                    needMinSearch = false;
                }

                if (needMaxSearch && days[i - 1] == curMax)
                {
                    curMax = days[i];
                    for (int j = 1; j < k; j++)
                    {
                        if (days[i + j] > curMax)
                        {
                            curMax = days[i + j];
                        }
                    }
                }

                if (needMinSearch && days[i-1] == curMin)
                {
                    curMin = days[i];
                    for (int j = 1; j < k; j++)
                    {
                        if (days[i + j] < curMin)
                        {
                            curMin = days[i + j];
                        }
                    }
                }

                currentValue = curMax - curMin;
                if (currentValue > value)
                {
                    value = currentValue;
                    index = i;
                }
            }

            Console.WriteLine($"{value}\n{index + 1}");

        }
    }
}