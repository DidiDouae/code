# FeverTokens Tech Test 


# Task 2

This task involves printing a sequence of numbers from 1 to 100, with these specific rules:
* If a number is divisible by 3, print "Hello" instead.
* If a number is divisible by 5, print "World" .
* If a number is divisible by 7, print "Yoo" .

**Programming language 1 :Python Code**

```python
output_list = []

for i in range(1, 101):
    output = ""
    if i % 3 == 0:
        output += "Hello"
    if i % 5 == 0:
        output += " world"
    if i % 7 == 0:
        output += " yoo"
    if not output:
        output = str(i)
    output_list.append(output.strip())

print(" , ".join(output_list))
```

***Output***
![Alt text](/Ressources/python.png)



**Programming language 2 :Java Code**

```java
import java.util.*;

public class Task2 {
    public static void main(String[] args) {
        StringBuilder output = new StringBuilder();
        String delimiter = ", ";  // Delimiter for separated outputs (optional)

        for (int i = 1; i < 101; i++) {
            String result = "";
            if (i % 3 == 0) {
                result += "Hello ";
            }
            if (i % 5 == 0) {
                result += "World ";
            }
            if (i % 7 == 0) {
                result += "Yoo ";
            }
            if (result.isEmpty()) {
                result = String.valueOf(i);
            }
            output.append(result).append(delimiter);
        }

    }
}
```
***Output***
![Alt text](/Ressources/java.png)


# Task 3

To solve this problem, we can use concepts from graph theory and data structures, inspired by a breadth-first search (BFS)-like approach. This systematic approach will ensure that we cover all possible locations in both directions on an infinite, bidirectional highway, guaranteeing we find our friend’s car eventually.

## Approach Explanation

Since we don’t know the direction or the distance to our friend's car, the best strategy is to employ a method that guarantees exploration of every possible location on the highway.

### Modeling the Highway

We can model the highway as a line of points, each representing a position ( with starting position at 0). The task then is to explore both directions with an increasing range.

## Step-by-Step Solution

### Step 1: Define  Starting Point

- Start at position `0` on the highway.

### Step 2: Choose a Search Pattern

1. Begin by moving one unit in one direction, then return to the starting point.
2. Move one unit in the opposite direction, then return to the starting point.
3. Continue this process by extending the range by one unit each time, alternating between directions.

### Step 3: Implement the Alternating Search Pattern

Move as follows:
- **Step 1**: Move 1 unit to the right (position `+1`), then return to `0`.
- **Step 2**: Move 1 unit to the left (position `-1`), then return to `0`.
- **Step 3**: Move 2 units to the right (position `+2`), then return to `0`.
- **Step 4**: Move 2 units to the left (position `-2`), then return to `0`.

Repeat this pattern, incrementing the distance each time:
- **Step `2n + 1`**: Move `n` units to the right, return to `0`.
- **Step `2n + 2`**: Move `n` units to the left, return to `0`.

### Step 4: Continue Until  Finding the Friend

This alternating expansion ensures we systematically cover every possible location in both directions on the highway. Given enough time, you will find your friend’s car, as you will eventually reach his position.

## Graph Representation

We can represent this problem with a simple graph where:
- Each **node** represents a position on the highway.
- **Edges** represent movement from one position to another.

## Complexity Analysis

- **Time Complexity**: \( O(d) \), where \( d \) is the distance to the friend. This approach guarantees that we will find your friend in finite time as it covers each possible position step-by-step.
- **Space Complexity**: \( O(1) \), as we only need counters to track the current search distance and direction. No additional data structures are required to store explored nodes.

## Summary

This alternating search pattern ensures that we will find the friend's car in a finite amount of time, regardless of his direction and distance from ours.