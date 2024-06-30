namespace MusicHub
{
    using System;
    using System.Text;
    using Data;
    using Initializer;
    using MusicHub.Data.Models;

    public class StartUp
    {
        public static void Main()
        {
            MusicHubDbContext context =
                new MusicHubDbContext();

            DbInitializer.ResetDatabase(context);

            var result = ExportSongsAboveDuration(context, 4);
            Console.WriteLine(result);

        }

        public static string ExportAlbumsInfo(MusicHubDbContext context, int producerId)
        {
            var albums = context.Albums
                .Where(a => a.ProducerId.HasValue && a.ProducerId.Value == producerId)
                .ToList()
                .OrderByDescending(a => a.Price)
                .Select(a => new
                {
                    AlbumName = a.Name,
                    ReleaseDate = a.ReleaseDate.ToString("MM/dd/yyyy"),
                    ProducerName = a.Producer.Name,
                    Songs = a.Songs.Select(s => new
                    {
                        SongName = s.Name,
                        Price = s.Price.ToString("F2"),
                        Writer = s.Writer.Name
                    })
                    .OrderByDescending(s => s.SongName)
                    .ThenBy(s => s.Writer)
                    .ToList(),
                    AlbumPrice = a.Price.ToString("F2")
                });

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var album in albums) {
                stringBuilder.AppendLine($"-AlbumName: {album.AlbumName}");
                stringBuilder.AppendLine($"-ReleaseDate: {album.ReleaseDate}");
                stringBuilder.AppendLine($"-ProducerName: {album.ProducerName}");
                stringBuilder.AppendLine($"-Songs:");

                int counter = 1;
                foreach (var song in album.Songs) {
                    stringBuilder.AppendLine($"---#{counter}");
                    stringBuilder.AppendLine($"---SongName: {song.SongName}");
                    stringBuilder.AppendLine($"---Price: {song.Price}");
                    stringBuilder.AppendLine($"---Writer: {song.Writer}");
                    counter++;
                }

                stringBuilder.AppendLine($"-AlbumPrice: {album.AlbumPrice}");
            }

            return stringBuilder.ToString().TrimEnd();            
        }

        public static string ExportSongsAboveDuration(MusicHubDbContext context, int duration)
        {
            var songs = context.Songs
                .ToList()
                .Where(s => s.Duration.TotalSeconds > duration)
                .OrderBy(s => s.Name)
                .ThenBy(s => s.Writer.Name)
                .ThenBy(s => s.SongPerformers.Select(sp => sp.Performer.FirstName))
                .Select(s => new
                {
                    SongName = s.Name,
                    Performers = s.SongPerformers
                        .Select(sp => sp.Performer.FirstName + " " + sp.Performer.LastName)
                        .OrderBy(p => p)
                        .ToList(),
                    Writer = s.Writer.Name,
                    AlbumProducer = s.Album.Producer.Name,
                    Duration = s.Duration.ToString("c")
                });

            StringBuilder stringBuilder = new StringBuilder();
            int counter = 1;
            foreach (var song in songs) {
                stringBuilder.AppendLine($"-Song #{counter}");
                stringBuilder.AppendLine($"---SongName: {song.SongName}");
                stringBuilder.AppendLine($"---Writer: {song.Writer}");
                foreach (var performer in song.Performers)
                {
                    stringBuilder.AppendLine($"---Performer: {performer}");
                }
                stringBuilder.AppendLine($"---AlbumProducer: {song.AlbumProducer}");
                stringBuilder.AppendLine($"---Duration: {song.Duration}");
                counter++;
            }

            return stringBuilder.ToString().TrimEnd();
        }
    }
}
