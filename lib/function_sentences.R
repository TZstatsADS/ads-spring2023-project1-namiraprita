#3
i=1
for(i in 1:nrow(author.speech.list)){
  sentences=syuzhet::get_sentences(author.speech.list$fulltext[i])
  if(length(sentences)>0){
    emotions=matrix(emotion(sentences)$emotion, 
                    nrow=length(sentences), 
                    byrow=T)
    colnames(emotions)=emotion(sentences[1])$emotion_type
    emotions=data.frame(emotions)
    emotions=select(emotions,
                    anticipation,
                    joy, 
                    surprise, 
                    trust, 
                    anger, 
                    disgust, 
                    fear, 
                    sadness)
    word.count=f.word_count(sentences)
    # colnames(emotions)=paste0("emo.", colnames(emotions))
    # in case the word counts are zeros?
    # emotions=diag(1/(word.count+0.01))%*%as.matrix(emotions)
    author.sentence.list=rbind(author.sentence.list, 
                               cbind(author.speech.list[i,-ncol(author.speech.list)],
                                     sentences=as.character(sentences), 
                                     word.count=word.count,
                                     emotions,
                                     sent.id=1:length(sentences)
                               )
    )
  }
}
