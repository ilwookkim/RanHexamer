#' hxmer_generator
#'
#'  This function allows the user to generate a list of DNA seq and a distance matrix.
#' @param num_words number of words in the list. Default to 96.
#' @param h_dist hamming distance of each seq. Default to 3.
#' @param show_df an option to show the distance matrix. Default to TRUE.
#' @return a List of Words and a distance matrix
#' @examples
#' hxmer_generator(num_words = 5, h_dist = 3, show_df = TRUE)
#' @export
#' @importFrom stringr str_count

hxmer_generator <- function(num_words = 96, h_dist = 3, show_df = TRUE){

  all_comb <- expand.grid(replicate(6, c('A','C','G','T'), simplify = FALSE))
  df_args <- c(all_comb, sep="")
  all_seq <- do.call(paste, df_args) # Generate all possible sequence combination
  possible_comb <- c() # Empty list for numbers of possible seq[i] combination from all other seq.

  for(j in 1:length(all_seq)){ # Check from first seq to last seq
    i=j
    sel_seq <- all_seq # Copy the list to protect original list

    while(i<length(sel_seq)){
      seq <- sel_seq[i]
      sel_seq <- c(seq, sel_seq[which(.str_dist_cal(seq, sel_seq)>=h_dist)])
      # Delete sequences that differ less than three positions from sel_seq[i].
      i = i+1
    }
    possible_comb <- c(possible_comb,length(sel_seq)) # Record the number of possible combination from seq[1]
    if(any(possible_comb >= num_words)){
      final_seq <- sample(sel_seq, num_words)
      print(final_seq)
      cat('\n')
      break
      # If the number of possible combination are more than 96, Stop and show the list.
    } else {
      cat(paste('Possible hexamers are smaller than',num_words,". Try to use smaller number"))
    }
  }
  if(show_df) {
    # It is for the distance matrix
    # If argument show_df = TRUE, show up the distance matrix for the above selected list (final_seq).
    df <- as.data.frame(matrix(0,
                               nrow = length(final_seq),
                               ncol = length(final_seq)))
    rownames(df) <- final_seq
    colnames(df) <- final_seq
    # Generate data frame (Here 96 x 96)

    for (i in seq_len(length(final_seq))) {
      for (j in seq_len(length(final_seq))) {
        z <- str_count(strsplit(rownames(df), "")[[i]],
                       strsplit(colnames(df), "")[[j]])
        # Check two strings are matched (1) or not (0)
        df[i,j] <- length(z[z == 0])
        # Fill the Distance scores. These are the number of not_matched (0)
      }
    }
    print(df)
    # Print out the distance matrix as a table.
  }
}

.str_dist_cal <- function(seq, seq_l){
  a <- unlist(strsplit(seq, "")) # split a given sequence A into a single string
  b <- strsplit(seq_l[!is.na(seq_l)], "") # Split all given sequences in the list into a single string. Return list of strings
  val = rep(length(a), length(b)) # Score values for the distance matrix
  for(i in 1:(length(b))){
    for (j in 1:length(a)) {
      if(a[j]==b[[i]][j]){
        val[i] = val[i]-1
        # if seq A is matched other seq in the list : Score values (here 6) - number of match
      }

    }
  }
  return(val)
}
