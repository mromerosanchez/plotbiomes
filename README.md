# plotbiomes

R package for plotting [Whittaker' biomes](https://en.wikipedia.org/wiki/Biome#Whittaker_.281962.2C_1970.2C_1975.29_biome-types) with [ggplot2](https://github.com/tidyverse/ggplot2).

The original graph is Figure 5.5 in *Ricklefs, R. E. (2008), The economy of nature. W. H. Freeman and Company.* (Chapter 5, Biological Communities, The biome concept). The figure was processed and brought into an R friendly format. Details are given in [Whittaker_biomes_dataset.html](https://rawgit.com/valentinitnelav/plotbiomes/master/html/Whittaker_biomes_dataset.html) document.

Plotting Whittaker' biomes was also addressed in [BIOMEplot](https://github.com/kunstler/BIOMEplot) package by Georges Kunstler and in [ggbiome](https://github.com/guillembagaria/ggbiome) package by Guillem Bagaria, Victor Granda and Georges Kunstler.

## Installation

You can install `plotbiomes` from github with:

``` r
# install.packages("devtools")
devtools::install_github("valentinitnelav/plotbiomes")
```

## Examples & Vignettes

Check examples at [Whittaker_biomes_examples.html](https://rawgit.com/valentinitnelav/plotbiomes/master/html/Whittaker_biomes_examples.html) and [Check_outliers.html](https://rawgit.com/valentinitnelav/plotbiomes/master/html/Check_outliers.html) vignettess. 

Simple example of plotting Whittaker' biomes:

``` r
library(plotbiomes)
library(ggplot2)
# Plot Whittaker' biomes with ggplot()
ggplot() +
 geom_polygon(data = Whittaker_biomes,
              aes(x      = temp_c,
                  y      = precp_cm,
                  fill   = biome),
              colour = "gray98", # colour of polygon border
              size   = 0.5) +    # thickness of polygon border
 # fill polygons with predefined colors (as in Ricklefs, 2008)
 scale_fill_manual(name   = "Whittaker biomes",
                   breaks = names(Ricklefs_colors),
                   labels = names(Ricklefs_colors),
                   values = Ricklefs_colors) +
 theme_bw()
 
 
 # Running the following produces the same output as above, but is less verbose
 
 whittaker_base_plot() +
  theme_bw()
 
```

![](man/figures/README-example-1.png)
