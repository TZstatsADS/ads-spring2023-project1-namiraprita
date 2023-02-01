# ADS Project 1:  R Notebook on the history of philosophy

### Code dev/lib Folder

The lib directory contains various files with function definitions and computation codes for your data analysis. 

For this project there are several functions created, with details as follow:
1. function_boxplot : the aim of this function is to produce more-detailed boxplot, for sentence length, by adding its statistical figures: mean, median, and standard deviation.

2. function_emotion : the 1a and 1b function provides code to create a figure depicting changes in sentence length and emotions associated with it using NCR Lexicon. Furthermore, the 2nd function's purpose is to portray the proportion of positive, negative, and neutral sentiments tailored to each author's works. 

3. function_sentences & function_sentences2: using syuzhet library, both function aim to create a dataframe to define the emotionally charged sentence. The dataframe consists of the sentences, number of words, emotions associated with it, and doc number.

4. function_speech : provide the number of words in a given string ('str') using stringr library.

5. function_worldcloud : generate worldcloud by converting tokenized text to Corpus, removing numbers, punctuation, stopwords, whitespace, produce Term Document Matrix (TDM), and construct worldcloud with specific design. 

