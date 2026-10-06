import from collections { Counter }
import heapq;
def rearrange_string(s: str, k: int) -> str {
    if (k == 1) {
        return ''.join(sorted(s));
    }
    counter = Counter(s);
    max_heap = [(-freq, char) for (char, freq) in counter.items()];
    heapq.heapify(max_heap);
    result = [];
    wait_queue = [];
    while max_heap {
        (freq, char) = heapq.heappop(max_heap);
        result.append(char);
        wait_queue.append((char, (freq + 1)));
        if (len(wait_queue) >= k) {
            (released_char, released_freq) = wait_queue.pop(0);
            if (released_freq < 0) {
                heapq.heappush(max_heap, (released_freq, released_char));
            }
        }
    }
    result_str = ''.join(result);
    return result_str if (len(result_str) == len(s)) else "impossible";
}

