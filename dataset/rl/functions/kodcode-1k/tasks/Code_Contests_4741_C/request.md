# classify_sentiment

Analyze the sentiment of a review based on a predefined lexicon.

The sentiment classification is based on the aggregate sentiment of words in the review 
and categorizes it into three categories: 
- 1 for positive
- 0 for neutral
- -1 for negative

>>> classify_sentiment("the product is good and makes me happy")
1
>>> classify_sentiment("the service was ok but delivery was terrible")
-1

Implement `classify_sentiment(review: str) -> int`.
