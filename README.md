
PowerShell Tic-Tac-Toe Game

A simple text-based Tic-Tac-Toe game implemented in PowerShell with an adjustable AI difficulty level. The game allows you to play against an AI opponent, and you can control the AI's winning probability to make the game easier or harder.

**Features**

- Text-Based Interface: Play Tic-Tac-Toe directly in your PowerShell terminal.
- Adjustable AI Difficulty: Control the AI's winning probability to make the game more or less challenging.
- Win/Draw Detection: The game automatically detects when a player wins or if the game ends in a draw.
- Simple and Lightweight: No additional software or dependencies required—just run the script in PowerShell.

 **How to Play**

1. Clone or Download the Script:
   - Save the script (`TicTacToe.ps1`) to your local machine.

2. Run the Script:
   - Open PowerShell and navigate to the directory where the script is saved.
   - Run the script using the following command:
     ```powershell
     .\TicTacToe.ps1
     ```

3. Gameplay:
   - The game board will be displayed with numbers 1-9 representing each cell.
   - On your turn, enter the number corresponding to the cell where you want to place your mark (`X`).
   - The AI will then make its move (`O`).
   - The game will continue until a player wins or the game ends in a draw.

4. Adjust AI Difficulty:
   - Open the script in a text editor and locate the `$aiProbability` variable.
   - Set the value to a number between 0 and 100 (e.g., `50` for medium difficulty).
   - Lower values (e.g., 10): AI makes more random moves (easier to beat).
   - Higher values (e.g., 90): AI tries harder to win or block you (harder to beat).


**Example**

Here’s an example of how the game looks in the terminal:

```
-------------
| 1 | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------
Enter your move (1-9): 5
-------------
| 1 | 2 | 3 |
-------------
| 4 | X | 6 |
-------------
| 7 | 8 | 9 |
-------------
AI is thinking...
-------------
| 1 | 2 | 3 |
-------------
| 4 | X | 6 |
-------------
| 7 | 8 | O |
-------------
```



Requirements

- **PowerShell**: The script is designed to run in PowerShell. It should work on Windows PowerShell 5.1 and PowerShell Core (cross-platform).

Customization

- **Change Player Marks**: Modify the script to use different symbols for the player and AI (e.g., `X` and `O`).
- **Add Graphics**: While this version is text-based, you can extend it with graphical elements using external libraries or frameworks.

## License

This project is open-source and available under the [MIT License](LICENSE). Feel free to modify and distribute it as needed.

## Contributing

Contributions are welcome! If you have ideas for improvements or new features, feel free to open an issue or submit a pull request.



Enjoy the game! 🎮
