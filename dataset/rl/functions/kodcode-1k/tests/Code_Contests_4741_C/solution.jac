def classify_sentiment(review: str) -> int {
    lexicon = {
        "good": 2,
        "happy": 3,
        "great": 4,
        "bad": -2,
        "sad": -3,
        "terrible": -4,
        "ok": 0,
        "neutral": 0
    };
    words = review.split();
    sentiment_score = sum(
        lexicon[word]
        for word in words
        if (word in lexicon)
    );
    if (sentiment_score > 0) {
        return 1;
    } elif (sentiment_score < 0) {
        return -1;
    } else {
        return 0;
    }
}

