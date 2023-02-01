#1a
function_emotion_p <- function(dataframe, author_p, author){
  
  # "anger"   "anticipation"   "disgust"     "fear"       
  # "joy"     "sadness"        "surprise"    "trust"
  
  col.use=c("light grey", "firebrick1", "aquamarine", "darkorange1", "darkorchid3",
            "deepskyblue2", "gold1", "burlywood1","gold4")
            
  dataframe$topemo_pos = apply(select(dataframe, anger:trust), 1, which.max)
  dataframe$topemo = apply(select(dataframe, anger:trust), 1, max)
  dataframe$topemo_pos[dataframe$topemo<0.01] = 0
  dataframe$topemo_pos = dataframe$topemo_pos + 1
  
  temp = dataframe$topemo
  dataframe$topemo[temp<0.05] = 1
  
  df = dataframe %>% 
    filter(author == author_p) %>% 
    select(sent_id, word_count, 
           topemo_pos, topemo)
  
  ptcol.use = alpha(col.use[df$topemo_pos], sqrt(sqrt(df$topemo)))
  
  plot(df$sent_id, df$word_count, 
       col=ptcol.use,
       type="h", main=author)
}

#1b
function_emotion_a <- function(dataframe, author_p, author){
  
  # "anger"   "anticipation"   "disgust"     "fear"       
  # "joy"     "sadness"        "surprise"    "trust"
  
  col.use=c("light grey", "firebrick1", "aquamarine", "darkorange1", "darkorchid3",
            "deepskyblue2", "gold1", "burlywood1","gold4")
            
  dataframe$topemo_pos = apply(select(dataframe, anger:trust), 1, which.max)
  dataframe$topemo = apply(select(dataframe, anger:trust), 1, max)
  dataframe$topemo_pos[dataframe$topemo<0.01] = 0
  dataframe$topemo_pos = dataframe$topemo_pos + 1
  
  temp = dataframe$topemo
  dataframe$topemo[temp<0.05] = 1
  
  df = dataframe %>% 
    filter(author == author_p) %>% 
    select(sent_id, word_counta, 
           topemo_pos, topemo)
  
  ptcol.use = alpha(col.use[df$topemo_pos], sqrt(sqrt(df$topemo)))
  
  plot(df$sent_id, df$word_counta, 
       col=ptcol.use,
       type="h", main=author)
}


#2 - Pie Chart
emotion_pie_chart <- function(emotion_df){
  emotion_sent <- analyzeSentiment( as.character(emotion_df$sentence_str))$SentimentQDAP
  emotion_result <- data.frame(emotion = convertToDirection(emotion_sent))
  
  negative <- length(emotion_result[emotion_result$emotion == "negative",])
  positive <- length(emotion_result[emotion_result$emotion == "positive",])
  netural <- length(emotion_result[emotion_result$emotion == "neutral",])
  
  val <- c(Negative = negative,Positive = positive, Netural = netural)
  pie_labels <- paste0(c("Negative","Positive", "Netural"), " = ", round(100 * val/sum(val), 2), "%")
  pie(val, labels = pie_labels, col=brewer.pal(n = 3, name = "RdBu")) 
}

