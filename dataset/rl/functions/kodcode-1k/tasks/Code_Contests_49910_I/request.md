# min_additional_time

Dr. Smith is organizing an online quiz competition consisting of multiple rounds. Each round has a certain number of questions and a fixed time limit to complete the round. To ensure fairness, Dr. Smith wants each participant to complete all questions in each round before time runs out.

However, some participants may be slower than others. To accommodate everyone, Dr. Smith has asked you to find the minimum additional time needed per participant so that even the slowest participant, given their answer rate, can complete all rounds on time.

Each participant needs exactly t seconds to answer one question. Your task is to calculate the minimum additional time needed for each participant to ensure they can answer all questions in all rounds within the given time limits.

Input Format:

- n: Number of rounds in the quiz competition
- t: Time required by a participant to answer one question
- ai: Number of questions in the i-th round
- bi: Time limit in seconds for the i-th round

Output Format:

Single integer representing the minimum additional time needed for each participant to complete all questions in all rounds.

Constraints:

1 ≤ n ≤ 2000
1 ≤ t, a[i], b[i] ≤ 10^6

SAMPLE INPUT
3
5
10 20 15
60 100 75

SAMPLE OUTPUT
25

Explanation:
For the first round, the participant requires 10 * 5 = 50 seconds, which is within the limit of 60 seconds. 
For the second round, the participant needs 20 * 5 = 100 seconds, which is exactly within the given limit.
For the third round, the participant requires 15 * 5 = 75 seconds, exactly within the limit of 75 seconds.

Thus, no additional time is needed for them to complete the first and third rounds, but for the second round, they require some additional time if their rate were slower. Taking into consideration the slowest possible rate, they would need an additional 25 seconds to complete the second round comfortably.

Example:
- `min_additional_time(3, 5, [10, 20, 15], [60, 100, 75]) == 0`

Implement `min_additional_time(n: int, t: int, a: list[int], b: list[int]) -> int`.
