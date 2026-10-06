# simplify_path

### Coding Assessment Question

#### Scenario:
You are developing a utility to manage hierarchical data, such as the structure of a file system. One feature of this utility is to convert a given file path into a simplified version without redundant components like "." (current directory) or ".." (parent directory). Your task is to implement a function that simplifies an absolute file path according to the Unix-style file path simplification rules.

#### Task:
Write a Jac function `simplify_path(path: str) -> str` that:
* Takes a string `path` which represents an absolute Unix-style file path.
* Returns the simplified canonical path.

### Specifications:
* **Input**: A single string `path` representing an absolute Unix-style file path.
* **Output**: A string representing the simplified canonical path.

### Constraints:
* The absolute path will always start with a single slash `/`.
* The output path must end with a single slash `/` unless it is the root `/`.
* Consecutive slashes `//` in the input should be treated as a single slash `/`.
* Dot `.` in the path represents the current directory and should be ignored.
* Double dot `..` moves up one directory level unless already at the root `/`.
* The length of the input path will be within the range `[1, 3000]`.

Example Inputs and Outputs:
1. `simplify_path("/home/")` should return `"/home/"`.
2. `simplify_path("/../")` should return `"/"`.
3. `simplify_path("/home//foo/")` should return `"/home/foo/"`.
4. `simplify_path("/a/./b/../../c/")` should return `"/c/"`.
5. `simplify_path("/a//b////c/d//././/..")` should return `"/a/b/c/"`.

### Edge Cases:
1. Input: `"/../.."`, Expected output: `"/"`
2. Input: `"/../../../../"`, Expected output: `"/"`
3. Input: `"/a/../../b/../c//.//"`, Expected output: `"/c/"`
4. Input: `"/."`, Expected output: `"/"`

### Example Error Handling:
No error handling is required for this task since inputs will always be valid strings.

### Note:
Ensure that the simplified path maintains the Unix-style file path rules and outputs the canonical form correctly.

Example:
- `simplify_path('/home/') == '/home/'`

Implement `simplify_path(path: str) -> str`.
