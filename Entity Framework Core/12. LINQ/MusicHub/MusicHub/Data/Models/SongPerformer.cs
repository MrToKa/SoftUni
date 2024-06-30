using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MusicHub.Data.Models
{
    public class SongPerformer
    {
        [Key]
        public int SongId { get; set; }
        public Song Song { get; set; }

        [Key]
        public int PerformerId { get; set; }
        public Performer Performer { get; set; }
    }
}
