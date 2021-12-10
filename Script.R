"
Author: Allan Pereira Fenelon
Goal: Minerar textos no Twitter
"

library(rtweet)
library(wordcloud)
library(tm)
library(RColorBrewer)
library(cluster)   
library(fpc)


buscador = search_tweets(
  "Spider-Man", n = 18000, lang = "en"
)

resultado_texto = buscador$text

Corpo_resultado = tm_map(VCorpus(VectorSource(resultado_texto)),
                         content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))
Corpo_resultado = tm_map(Corpo_resultado, content_transformer(tolower))
Corpo_resultado = tm_map(Corpo_resultado, content_transformer(removePunctuation))
Corpo_resultado = tm_map(Corpo_resultado,removeWords, stopwords("english"))

cores_visualizacao = brewer.pal(8,"Dark2")

wordcloud(Corpo_resultado,min.freq=5,max.words=100, random.order=T, colors=cores_visualizacao)

