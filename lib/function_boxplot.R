boxplot_stats_p <- function(y,upper_limit = max(plato_boxplot$sentence_length)){
  return(data.frame( y = max(plato_boxplot$sentence_length),
                     label = paste("Count =", length(y), "\n",
                                   "Mean =", round(mean(y), 2), "\n",
                                   "Median =", round(median(y), 2), "\n",
                                   "std =", round(sd(y), 2), "\n")))}

boxplot_stats_a <- function(y,upper_limit = max(ari_boxplot$sentence_length)){
  return(data.frame( y = max(ari_boxplot$sentence_length),
                     label = paste("Count =", length(y), "\n",
                                   "Mean =", round(mean(y), 2), "\n",
                                   "Median =", round(median(y), 2), "\n",
                                   "std =", round(sd(y), 2), "\n")))}