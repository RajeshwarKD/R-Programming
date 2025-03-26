# Load necessary libraries
library(tidytext)
library(dplyr)
library(tm)
library(topicmodels)
library(syuzhet)
library(ggplot2)

# Sample text data
text_data <- c("I love using R for data analysis. It is a powerful tool.",
               "Text mining is fascinating and provides great insights.",
               "I feel frustrated when the code doesn't work as expected.",
               "The weather is beautiful today, and I am very happy.",
               "I am not sure how to proceed with this project.",
               "R makes statistical analysis so much easier and fun.",
               "I am excited about the new features in the latest R version.",
               "This is the worst experience I have ever had with this software.",
               "The food at that restaurant was absolutely delicious.",
               "I am feeling very anxious about the upcoming exam.")

# Convert text data to a data frame
text_df <- data_frame(line = 1:length(text_data), text = text_data)

# Tokenize the text data
tidy_text <- text_df %>%
  unnest_tokens(word, text)

# Perform sentiment analysis using the NRC lexicon
sentiment_analysis <- tidy_text %>%
  inner_join(get_sentiments("nrc"), by = "word") %>%
  count(sentiment, sort = TRUE)

# Plot the sentiment analysis results
ggplot(sentiment_analysis, aes(x = reorder(sentiment, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Sentiment Analysis using NRC Lexicon",
       x = "Sentiment",
       y = "Frequency") +
  theme_minimal()

# Create a Document-Term Matrix (DTM) for topic modeling
corpus <- Corpus(VectorSource(text_data))
dtm <- DocumentTermMatrix(corpus, control = list(stopwords = TRUE, removePunctuation = TRUE, removeNumbers = TRUE))

# Perform Latent Dirichlet Allocation (LDA) for topic modeling
lda_model <- LDA(dtm, k = 2, control = list(seed = 1234))
topics <- tidy(lda_model, matrix = "beta")

# Plot the top terms for each topic
top_terms <- topics %>%
  group_by(topic) %>%
  top_n(5, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

ggplot(top_terms, aes(x = reorder(term, beta), y = beta, fill = factor(topic))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip() +
  labs(title = "Top Terms in Each Topic",
       x = "Term",
       y = "Beta") +
  theme_minimal()

# Text classification using a simple example (positive/negative sentiment)
text_df <- text_df %>%
  mutate(sentiment = get_sentiment(text_data, method = "afinn"))

# Classify text as positive or negative based on sentiment score
text_df <- text_df %>%
  mutate(sentiment_class = ifelse(sentiment > 0, "Positive", "Negative"))

# View the classified text data
print(text_df)

# Plot the sentiment classification results
ggplot(text_df, aes(x = factor(sentiment_class), fill = factor(sentiment_class))) +
  geom_bar() +
  labs(title = "Sentiment Classification",
       x = "Sentiment Class",
       y = "Count") +
  theme_minimal()