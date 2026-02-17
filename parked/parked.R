library(tidyverse)

lyric <- read_file('lyrics/astley.txt')

lyric <- str_extract_all(lyric, "[a-zA-Z']+")
lyric <- lyric[[1]]

lyric <- tibble(word = tolower(lyric)) |>
  group_by(word) |>
  summarize(count = n())

p = ggplot(lyric, aes(x = word, y = count)) +
  geom_col() +
  labs(
    x = 'Word',
    y = 'Count'
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave('lyrics.png', plot = p, height = 900, width = 2400, unit = 'px')
