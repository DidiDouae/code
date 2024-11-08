# FeverTokens Tech Test 

# Task 1
This repository demonstrates a CI/CD pipeline using GitHub Actions to build, push, and deploy a Dockerized web application. The application displays a simple HTML message, "Good Morning Vietnam," and is deployed on a Docker Swarm cluster.

## Purpose
The goal of this project is to set up a fully automated workflow that builds and deploys a web application on a Docker Swarm cluster using GitHub Actions. The repository contains:
- An HTML file (`index.html`) served through an Nginx web server.
- A `Dockerfile` for containerizing the application.
- A GitHub Actions workflow to automate Docker image building, tagging, pushing, and deployment on a Docker Swarm cluster.

## Prerequisites
To follow along or contribute to this project, we will need:
- A private GitHub repository.
- Docker Hub account and credentials (username and access token).
- Access to [Play with Docker (PWD)](https://labs.play-with-docker.com/) for setting up a Docker Swarm cluster.

## Repository Structure
- **index.html**: HTML file with "Good Morning Vietnam" message.
- **Dockerfile**: Defines a Docker image using Nginx to serve `index.html`.
- **ressources/**: Folder for storing images or additional resources for the app.
- **ci-cd.yml**: GitHub Actions workflow for automating build, push, and deployment to Docker Swarm.
## Steps Followed 

### 1. Create and Edit Files
- **index.html**: Add the content `"Good Morning Vietnam"`.
- **Dockerfile**: Create a Docker image that serves the HTML file using Nginx.

### 2. Set Up GitHub Secrets
- Add Docker Hub credentials as secrets (`MY_DOCKER_USERNAME` and `MY_DOCKER_TOKEN`).
- Add SSH secret Key (`SSH_SECRET_KEY` ).

### 3. CI/CD Pipeline Setup
- **Triggering**: The workflow triggers only on changes to `index.html`.
- **Building and Pushing the Docker Image**: The pipeline builds and tags the Docker image as `latest` and pushes it to Docker Hub.
- **Deploying on Docker Swarm**: The workflow connects to the Docker Swarm manager node via SSH, deploying the app using `docker stack deploy` to run only on the worker node on port `80`.

### 4. Workflow File: `.github/workflows/ci-cd.yml`
- Contains steps to generate an SSH key for connecting to the Swarm manager.
- Includes Docker build, push, and deployment instructions.

### 5. Docker Swarm Setup
- **Initialize Docker Swarm**: Start a new session in [Play with Docker](https://labs.play-with-docker.com/).
![Alt text](/Ressources/Swarm setup)
- **Setup**: Configure a Docker Swarm cluster with one manager and one worker node.

### Validation and Testing

The CI/CD workflow was triggered correctly upon changes to the `index.html` file, as expected. The pipeline executed the steps for building and tagging the Docker image, followed by pushing the image to Docker Hub. However, during the deployment phase on the Docker Swarm cluster, an issue occurred when attempting to connect to the Docker Swarm manager node via SSH. 

***Troubleshooting Steps***

To resolve the issue, I navigated through several possible causes and attempted many  troubleshooting steps like :

1. **SSH Key Validation**: I verified that the correct SSH key was generated and added to the GitHub Actions workflow using the command `ssh-keygen -t ed25519 -P "" -f ~/.ssh/id_ed25519`. This step was confirmed in the workflow logs, and I ensured the public key was added to the appropriate server.

2. **Port 22 Resetting**: I examined whether there was any issue with port 22 (the default SSH port) on the remote host. I confirmed that the port was open and reachable by checking for any port-specific issues in the network configuration.

3. **SSH Daemon Restart**: I attempted restarting the SSH service on the Docker Swarm manager node by running the `systemctl restart ssh` command. However, the connection was still terminated with the same error message, suggesting the issue was not related to SSH service availability.

4. **Network Connectivity**: Despite validating the network setup and ensuring no firewall blocks on either side, the SSH connection was still refused by the remote host.

### Conclusion
Despite all troubleshooting efforts, the deployment could not be completed due to the SSH connection being closed by the remote host. Further investigation into the specific network and SSH configuration of the Play with Docker environment is required to pinpoint the exact cause of the issue.

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