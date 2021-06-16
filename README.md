# **RanHexamer**
Random Hexamer generator for the multiple displacement amplification (MDA)

## Installation

The **development** version can be installed from GitHub using:

``` r
devtools::install_github("ilwookkim/RanHexamer")
```

### Usage

parameters\\
num_word  : number of hexamers\\
h_dist    : hamming distance of each hexamer\\
show_df   : an option to show the distance matrix of hexamers\\

``` r
library(RanHexamer)

hxmer_generator(num_words = 10, h_dist = 3, show_df = TRUE)

 [1] "CTCCTA" "ACTGAA" "CGGTTA" "CATATA" "AAGTCA" "TCCGGA" "ATTTTA" "GAGCTA"
 [9] "AAAAAA" "GACACA"
 
        CTCCTA ACTGAA CGGTTA CATATA AAGTCA TCCGGA ATTTTA GAGCTA AAAAAA GACACA
CTCCTA      0      5      3      3      5      4      3      3      5      4
ACTGAA      5      0      5      4      4      3      3      5      3      5
CGGTTA      3      5      0      3      3      5      3      3      5      5
CATATA      3      4      3      0      4      5      3      3      3      3
AAGTCA      5      4      3      4      0      5      3      3      3      3
TCCGGA      4      3      5      5      5      0      5      5      5      4
ATTTTA      3      3      3      3      3      5      0      4      4      5
GAGCTA      3      5      3      3      3      5      4      0      4      3
AAAAAA      5      3      5      3      3      5      4      4      0      3
GACACA      4      5      5      3      3      4      5      3      3      0

```


