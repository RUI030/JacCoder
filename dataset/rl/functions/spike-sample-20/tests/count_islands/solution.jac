def count_islands(grid: list[str]) -> int {
    seen: set[tuple[int, int]] = set();
    count = 0;
    for r in range(len(grid)) {
        for c in range(len(grid[r])) {
            if grid[r][c] != "#" or (r, c) in seen {
                continue;
            }
            count += 1;
            stack: list[tuple[int, int]] = [(r, c)];
            seen.add((r, c));
            while stack {
                (y, x) = stack.pop();
                for (dy, dx) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                    ny = y + dy;
                    nx = x + dx;
                    if 0 <= ny < len(grid) and 0 <= nx < len(grid[ny]) and grid[ny][nx] == "#" and (ny, nx) not in seen {
                        seen.add((ny, nx));
                        stack.append((ny, nx));
                    }
                }
            }
        }
    }
    return count;
}
