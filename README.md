# **RanHexamer**
Random Hexamer generator for the multiple displacement amplification (MDA)

## Installation

The **development** version can be installed from GitHub using:

``` r
devtools::install_github("ilwookkim/RanHexamer")
```

### Usage

parameters
num_word  : number of hexamers
h_dist    : hamming distance of each hexamer
show_df   : an option to show the distance matrix of hexamers

``` r
library(RanHexamer)

hxmer_generator(num_words = 96, h_dist = 3, show_df = TRUE)
```
