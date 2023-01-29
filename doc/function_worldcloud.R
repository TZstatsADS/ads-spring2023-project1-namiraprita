# WorldCloud function

function.worldcloud <- function(pd_split, pd_name, wordcloud_color){
  pd_data <- as.data.frame(pd_split)
  colnames(pd_data) <- colnames(pd)
  pd_data_cor <- Corpus(VectorSource(pd_data$tokenized_txt))
  pd_data_tidy <- pd_data_cor %>% 
    tm_map(removeNumbers) %>%
    tm_map(removePunctuation) %>%
    tm_map(removeWords, c("will", "one", "can", "must", "just", "since", "yet", "might", "two", "may","however", stopwords("english"))) %>%
    tm_map(stripWhitespace) %>%
    TermDocumentMatrix() %>% 
    tidy()
  pd_data_overall <- pd_data_tidy %>% 
    group_by(term) %>% 
    summarise(frequency = sum(count)) %>% 
    arrange(desc(frequency))
  wordcloud(pd_data_overall$term, pd_data_overall$frequency,
            scale = c(3,0.1),
            max.words = 70,
            min.freq = 1,
            random.order = FALSE,
            rot.per = 0.35,
            random.color = FALSE,
            colors = brewer.pal(9, wordcloud_color))
  title(main = pd_name,line = 0.1, cex.main = 2)
}