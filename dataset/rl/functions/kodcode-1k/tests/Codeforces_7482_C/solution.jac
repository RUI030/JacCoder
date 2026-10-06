"""
    Given a list of gross salaries, calculate the net salaries after tax deduction.
    Args:
    gross_salaries (list of int): List containing gross salaries of employees.

    Returns:
    list of int: List containing net salaries of employees after tax deduction.
    """
def calculate_net_salaries(gross_salaries: list[int]) -> list[int] {
    net_salaries = [];
    for salary in gross_salaries {
        if (salary <= 50000) {
            tax = 0.1 * salary;
        } elif (salary <= 100000) {
            tax = 0.2 * salary;
        } else {
            tax = 0.3 * salary;
        }
        net_salary = salary - tax;
        net_salaries.append(int(net_salary));
    }
    return net_salaries;
}

