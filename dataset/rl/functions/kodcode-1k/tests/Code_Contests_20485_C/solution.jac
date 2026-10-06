def min_rest_days(n: int, activities: list[int]) -> int {
    REST = 0;
    CONTEST = 1;
    STUDY = 2;
    BOTH = 3;
    rest_days = 0;
    last_activity = REST;
    for day in activities {
        if (day == REST) {
            rest_days += 1;
            last_activity = REST;
        } elif (day == CONTEST) {
            if (last_activity in [CONTEST, BOTH]) {
                rest_days += 1;
                last_activity = REST;
            } else {
                last_activity = CONTEST;
            }
        } elif (day == STUDY) {
            if (last_activity in [STUDY, BOTH]) {
                rest_days += 1;
                last_activity = REST;
            } else {
                last_activity = STUDY;
            }
        } elif (day == BOTH) {
            if (last_activity == REST) {
                last_activity = BOTH;
            } elif (last_activity == STUDY) {
                last_activity = CONTEST;
            } elif (last_activity == CONTEST) {
                last_activity = STUDY;
            } else {
                rest_days += 1;
                last_activity = REST;
            }
        }
    }
    return rest_days;
}

