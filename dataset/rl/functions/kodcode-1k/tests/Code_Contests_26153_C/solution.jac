def toll_booth(n: int, vehicles: list[int]) -> str {
    cash_in_hand = 0;
    for vehicle in vehicles {
        if (vehicle == 1) {
            cash_in_hand += 5;
        } elif (vehicle == 2) {
            if (cash_in_hand >= 5) {
                cash_in_hand += 10;
                cash_in_hand -= 5;
            } else {
                return "FAIL";
            }
        }
    }
    return "SUCCESS";
}

