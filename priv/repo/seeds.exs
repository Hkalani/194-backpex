# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Teacher.Repo.insert!(%Teacher.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Teacher.Music

albums = [
  %{
    artist: "The Beatles",
    title: "Sgt. Pepper's Lonely Hearts Club Band",
    year: 1967,
    description: "A groundbreaking album that redefined popular music with its innovative production, eclectic influences, and conceptual unity."
  },
  %{
    artist: "Led Zeppelin",
    title: "Led Zeppelin IV",
    year: 1971,
    description: "Featuring the iconic 'Stairway to Heaven,' this album solidified Led Zeppelin's status as rock legends and influenced countless bands."
  },
  %{
    artist: "Pink Floyd",
    title: "The Dark Side of the Moon",
    year: 1973,
    description: "A progressive rock masterpiece, known for its complex compositions, philosophical lyrics, and pioneering use of studio effects."
  },
  %{
    artist: "The Rolling Stones",
    title: "Exile on Main St.",
    year: 1972,
    description: "A raw, gritty double album that blends rock, blues, and country, often considered the Rolling Stones' magnum opus."
  },
  %{
    artist: "The Who",
    title: "Who's Next",
    year: 1971,
    description: "With its explosive power and innovative use of synthesizers, this album became one of the defining records of the 1970s."
  },
  %{
    artist: "Jimi Hendrix",
    title: "Are You Experienced",
    year: 1967,
    description: "The debut album by the Jimi Hendrix Experience, showcasing Hendrix's revolutionary guitar work and psychedelic sound."
  },
  %{
    artist: "The Doors",
    title: "The Doors",
    year: 1967,
    description: "The debut album from The Doors, featuring the haunting 'The End' and the hit single 'Light My Fire.'"
  },
  %{
    artist: "The Eagles",
    title: "Hotel California",
    year: 1976,
    description: "A landmark album in rock history, known for its smooth sound, complex themes, and the iconic title track."
  },
  %{
    artist: "Fleetwood Mac",
    title: "Rumours",
    year: 1977,
    description: "A classic album that blends rock, pop, and folk influences, filled with personal turmoil and universally relatable themes."
  },
  %{
    artist: "Queen",
    title: "A Night at the Opera",
    year: 1975,
    description: "An eclectic and ambitious album, featuring the epic 'Bohemian Rhapsody,' which pushed the boundaries of rock music."
  },
  %{
    artist: "Bruce Springsteen",
    title: "Born to Run",
    year: 1975,
    description: "Springsteen's breakthrough album, combining heartland rock with cinematic storytelling, highlighted by the title track."
  },
  %{
    artist: "The Clash",
    title: "London Calling",
    year: 1979,
    description: "A double album that blends punk, reggae, rockabilly, and more, making it one of the most diverse and influential albums in rock."
  },
  %{
    artist: "AC/DC",
    title: "Back in Black",
    year: 1980,
    description: "A hard rock classic, recorded as a tribute to the band's late singer Bon Scott, featuring hits like 'Hells Bells' and 'You Shook Me All Night Long.'"
  },
  %{
    artist: "David Bowie",
    title: "The Rise and Fall of Ziggy Stardust and the Spiders from Mars",
    year: 1972,
    description: "A concept album that tells the story of the androgynous alien rock star Ziggy Stardust, blending glam rock with sci-fi themes."
  },
  %{
    artist: "The Velvet Underground",
    title: "The Velvet Underground & Nico",
    year: 1967,
    description: "An avant-garde album that was initially a commercial failure but became one of the most influential records in rock history."
  }
]

for album <- albums do
  Music.create_album(album)
end
