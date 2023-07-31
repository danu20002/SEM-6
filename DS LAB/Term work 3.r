install.packages("quanteda")
install.packages("RColorBrewer")
spam=read.csv("spam.csv",header=FALSE,sep=",",quote='\"\"',
stringsAsFactors=FALSE)
table(spam$v1)
## ham spam
## 4825 747
names(spam)<-c("type","message")
head(spam)
set.seed(2012)
spam<-spam[sample(nrow(spam)),] #randomly shuffling the dataset
library(quanteda)
msg.corpus<-corpus(spam$message)
docvars(msg.corpus)<-spam$type #auaching the class labels to the corpus
message text
#subsevng only the spam messages
spam.plot<-corpus_subset(msg.corpus,docvar1=="spam")
#now creaPng a document-feature matrix using dfm()
spam.plot<-dfm(spam.plot, tolower = TRUE, remove_punct = TRUE,
remove_twiuer=TRUE,remove_numbers=TRUE,
remove=stopwords("SMART"))
library(RColorBrewer)
spam.col <- brewer.pal(10, "BrBG")
textplot_wordcloud(spam.plot, min.freq = 16, color = spam.col)
Ptle("Spam Wordcloud", col.main = "grey14")
ham.plot<-corpus_subset(msg.corpus,docvar1=="ham")
ham.plot<-dfm(ham.plot,tolower = TRUE, remove_punct = TRUE,
remove_twiuer = TRUE, remove_numbers = TRUE,remove=c("gt", "lt",
stopwords("SMART")))
ham.col=brewer.pal(10, "BrBG")
textplot_wordcloud(ham.plot,min.freq=50,colors=ham.col,fixed.asp=TRUE)
Ptle("Ham Wordcloud",col.main = "grey14")
#separaPng Train and test data
spam.train<-spam[1:4458,]
spam.test<-spam[4458:nrow(spam),]
msg.dfm <- dfm(msg.corpus, tolower = TRUE) #generaPng document freq
matrix
msg.dfm <- dfm_trim(msg.dfm, min_count = 5, min_docfreq = 3)
head(msg.dfm)
#trining and tesPng data of dfm
msg.dfm.train<-msg.dfm[1:4458,]
msg.dfm.test<-msg.dfm[4458:nrow(spam),]
head(msg.dfm)
#Training the Naive Bayes classifiernb.classifier<-textmodel_nb(msg.dfm.train,spam.train[,1])
nb.classifier
pred<-predict(nb.classifier,msg.dfm.test)
# use pred$nb.predicted to extract the class labels
table(predicted=pred,actual=spam.test[,1])
#acccuracy of the classifier on Test data
mean(pred==spam.test[,1])*100
