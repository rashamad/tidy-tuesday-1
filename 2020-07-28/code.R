# install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)
library(gridExtra)
library(grid)
# install.packages("showtext")
library(showtext)
# install.packages("ggtern")
library(ggtern)

data(package = 'palmerpenguins')

glimpse(penguins)
summary(penguins)
glimpse(penguins_raw)

p1 <- penguins %>%
  drop_na() %>%
  ggplot(aes(x=body_mass_g, fill=species)) +
    geom_histogram(position = position_identity(),
                   alpha = .75,
                   bins = 25) +
    scale_fill_manual(values = c("#e8505b", "#f9d56e", "#14b1ab")) +
    theme_minimal() +
    labs(x = "Body Mass (g)",
         y = "",
         fill = "Species",
         title = "The Distribution of Body Mass in g",
         caption = "Created by Irfan Khalid (@MixtureModels)") +
    theme(
      legend.position = c(.95, .95),
      legend.justification = c("right", "top"),
      legend.box.just = "right",
      legend.margin = margin(6, 6, 6, 6),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      plot.background = element_rect(fill = "#f1f3f4", color = "#f1f3f4"),
      plot.title = element_text(size = 12),
      plot.caption = element_text(size = 8)
    )

p2 <- penguins %>%
  drop_na() %>%
  ggplot(aes(x=bill_length_mm, y=bill_depth_mm, color=species, shape=species)) +
    geom_point(size = 1.5) +
    scale_fill_manual(values = c("#e8505b", "#f9d56e", "#14b1ab")) +
    theme_minimal() +
    labs(x = "Bill Length (mm)",
         y = "Bill Depth (mm)",
         color = "Species",
         shape = "Species",
         title = "Bill Length (mm) vs Bill Depth (mm)",
         caption = "Created by Irfan Khalid (@MixtureModels)") +
    theme(
      legend.position = c(.95, .95),
      legend.justification = c("right", "top"),
      legend.box.just = "right",
      legend.margin = margin(6, 6, 6, 6),
      panel.grid.major = element_blank(),
      # panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      plot.background = element_rect(fill = "#f1f3f4", color = "#f1f3f4"),
      plot.title = element_text(size = 12),
      plot.caption = element_text(size = 8)
    )

p1
p2

install.packages("patchwork")
library(patchwork)
p1 + p2 + plot_annotation(
  title = "The penguins at the Palmer Station, Antarctica",
  subtitle = "Showing for each Species. Adelie, Gentoo, Chinstrap",
  theme = theme(
    plot.background = element_rect(fill ="#f1f3f4", color = "#f1f3f4"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 18),
    plot.subtitle = element_text(hjust = 0.5, size = 12)
  )
)
