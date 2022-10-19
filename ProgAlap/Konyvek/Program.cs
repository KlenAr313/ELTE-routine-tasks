namespace Konyvek
{
    class Book
    {
        public string Writer { get; set; }
        public string Title { get; set; }
        public int Pages { get; set; }

        public Book(string Writer, string Title, int Pages)
        {
            this.Writer = Writer;
            this.Title = Title;
            this.Pages = Pages;
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            int i = 0;
            int many = 0;
            many = Convert.ToInt32(Console.ReadLine());
            Book[] books = new Book[many];

            for (i = 0; i < many; i++)
            {
                string[] help = Console.ReadLine().Split(';');
                books[i] = new Book(help[0], help[1], Convert.ToInt32(help[2]));
            }

            int sum = 0;
            int jokaiCount = 0;
            int maxi = 1;
            for (i = 0; i < many; i++)
            {
                sum += books[i].Pages;
                if (books[i].Writer == "Jokai Mor")
                {
                    jokaiCount++;
                }
                if (books[maxi].Pages < books[i].Pages)
                {
                    maxi = i;
                }
            }
            Console.WriteLine($"{sum}\n{jokaiCount}\n{books[maxi].Title}");
        }
    }
}