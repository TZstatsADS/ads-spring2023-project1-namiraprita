# WorldCloud function

function.worldcloud <- function(pd_split, pd_name, wordcloud.color){
  pd_data <- as.data.frame(pd_split)
  colnames(pd_data) <- colnames(pd)
  pd_data_cor <- Corpus(VectorSource(pd_data$tokenized_txt))
  pd_data_tidy <- pd_data_cor %>% 
    tm_map(removeNumbers) %>%
    tm_map(removePunctuation) %>%
    tm_map(removeWords, c("will", "can", "must", "just", "since", "yet", "might","may","however", stopwords("english"))) %>%
    tm_map(stripWhitespace) %>%
    TermDocumentMatrix() %>% 
    tidy()
  pd_data_all <- pd_data_tidy %>% 
    group_by(term) %>% 
    summarise(frequency = sum(count)) %>% 
    arrange(desc(frequency))
  wordcloud(pd_data_all$term, pd_data_all$frequency,
            scale = c(3.5,0.5),
            max.words = 150,
            min.freq = 1,
            random.order = FALSE,
            rot.per = 0.35,
            random.color = FALSE,
            colors = brewer.pal(9, wordcloud.color))
  title(main = pd_name,line = 1, cex.main = 2)
}