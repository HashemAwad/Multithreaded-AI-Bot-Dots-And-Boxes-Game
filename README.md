# Dots and Boxes — C Implementation with Bot AI

A terminal-based implementation of the classic **Dots and Boxes** game, written in **C**, featuring modular game logic, robust move validation, and multiple AI difficulty levels. The project emphasizes **clean state management**, **rule correctness**, and **algorithmic decision-making**, making it both a playable game and a solid systems-level programming exercise.

---

## Overview

Dots and Boxes is a turn-based strategy game where players take turns drawing lines between adjacent dots. Completing the fourth side of a box claims it for the current player and grants an extra turn. The game ends when all boxes are claimed, and the player with the highest score wins.

This implementation supports:
- **Human vs Human**
- **Human vs Bot (Easy)**
- **Human vs Bot (Medium)**

The project is structured to separate **game state**, **core logic**, and **AI behavior**, keeping the codebase clean, extensible, and easy to reason about.

---

## Core Concepts & Design

### Game State Management

The entire game is driven by a single `GameState` struct that encapsulates:
- Horizontal and vertical line occupancy
- Box ownership
- Current player
- Player scores
- Remaining unclaimed boxes
- A printable ASCII board representation

This centralized state model enables:
- Deterministic gameplay
- Reliable rule enforcement
- Safe state simulation for AI evaluation

### Move Validation Pipeline

Every move passes through a strict validation process:
1. **Adjacency check** — only adjacent dots are allowed  
2. **Orientation detection** — horizontal vs vertical  
3. **Bounds validation**  
4. **Collision detection** — prevents overwriting existing lines  

The `process_move` function enforces these rules and updates both:
- The logical representation (`horizontal_lines`, `vertical_lines`)
- The printable board (`board`)

### Box Detection & Turn Logic

After every valid line placement:
- Adjacent boxes are checked for completion
- Boxes can be claimed **simultaneously** (important edge case)
- Scores are updated
- The current player only switches if **no box was completed**

This guarantees full compliance with standard Dots and Boxes rules.

---

## Bot AI Design

### Easy Bot

- Selects random valid moves  
- Useful for testing game flow and interaction  
- No strategic awareness  

### Medium Bot (Greedy Heuristic)

- Simulates all possible valid moves  
- Evaluates how many boxes each move would complete  
- Selects the move that maximizes immediate box gain  
- Falls back to random play if no scoring move exists  

Key technique:
- Uses **pass-by-value state simulation** to avoid mutating the real game state during evaluation.

This demonstrates foundational AI concepts such as:
- Lookahead through simulation
- Heuristic evaluation
- Decision-making under constraints

---

## Project Structure

    .
    ├── DotsAndBoxes.c   # Program entry point & game loop
    ├── Logic.c          # Core game rules, box handling, scoring
    ├── Bot.c            # AI logic (Easy & Medium bots)
    ├── game.h           # Shared definitions, structs, and prototypes
    └── README.md

---

## Build & Run

### Requirements
- GCC (or any C99-compatible compiler)
- Standard C library

### Compile

    gcc DotsAndBoxes.c Logic.c Bot.c -o dots_and_boxes

### Run

    ./dots_and_boxes

---

## Gameplay Instructions

- Choose a game mode at launch
- Enter moves using four integers: `r1 c1 r2 c2` (two adjacent dots)
- Example move: `0 0 0 1`
- Type `exit` at any prompt to quit

Board legend:
- `.` = dot
- `-` = horizontal line
- `|` = vertical line
- `A` / `B` = claimed boxes

---

## Notable Technical Highlights

- Deterministic game engine with no global state
- Clean separation between logic, I/O, and AI
- Defensive programming with explicit error codes
- Simulation-based AI without side effects
- Easily extensible to larger boards or stronger AI

---

## Possible Extensions

- Smarter bot using minimax or chain detection
- Dynamic board sizes
- Multiplayer over network sockets
- GUI frontend (SDL / ncurses)
- Performance benchmarking of AI strategies

---

## Contributors

- **Ameera Albahrani**
- **Hashem Awad**
- **Ahmad Faleh**
- **Mazen Hachem**
