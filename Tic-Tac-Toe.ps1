# Tic-Tac-Toe Game in PowerShell with Adjustable AI Winning Probability

    #Author: Pusker 
    #Email: propuskerworks@gmail.com
    #Date: 2018-08-18
    #Version: 1.0.0

# Initialize the game board
$board = @(1, 2, 3, 4, 5, 6, 7, 8, 9)

# Function to display the game board
function Display-Board {
    Write-Host "-------------"
    Write-Host "| $($board[0]) | $($board[1]) | $($board[2]) |"
    Write-Host "-------------"
    Write-Host "| $($board[3]) | $($board[4]) | $($board[5]) |"
    Write-Host "-------------"
    Write-Host "| $($board[6]) | $($board[7]) | $($board[8]) |"
    Write-Host "-------------"
}

# Function to check for a win
function Check-Win {
    param ($player)
    
    # Check rows, columns, and diagonals
    if (($board[0] -eq $player -and $board[1] -eq $player -and $board[2] -eq $player) -or
        ($board[3] -eq $player -and $board[4] -eq $player -and $board[5] -eq $player) -or
        ($board[6] -eq $player -and $board[7] -eq $player -and $board[8] -eq $player) -or
        ($board[0] -eq $player -and $board[3] -eq $player -and $board[6] -eq $player) -or
        ($board[1] -eq $player -and $board[4] -eq $player -and $board[7] -eq $player) -or
        ($board[2] -eq $player -and $board[5] -eq $player -and $board[8] -eq $player) -or
        ($board[0] -eq $player -and $board[4] -eq $player -and $board[8] -eq $player) -or
        ($board[2] -eq $player -and $board[4] -eq $player -and $board[6] -eq $player)) {
        return $true
    }
    return $false
}

# Function to check for a draw
function Check-Draw {
    foreach ($cell in $board) {
        if ($cell -is [int]) {
            return $false
        }
    }
    return $true
}

# Function for AI move with adjustable winning probability
function AI-Move {
    param ($probability)
    
    $random = Get-Random -Minimum 0 -Maximum 100
    if ($random -lt $probability) {
        # Try to win or block the player
        for ($i = 0; $i -lt 9; $i++) {
            if ($board[$i] -is [int]) {
                $board[$i] = 'O'
                if (Check-Win 'O') {
                    return
                }
                $board[$i] = $i + 1
            }
        }
        for ($i = 0; $i -lt 9; $i++) {
            if ($board[$i] -is [int]) {
                $board[$i] = 'X'
                if (Check-Win 'X') {
                    $board[$i] = 'O'
                    return
                }
                $board[$i] = $i + 1
            }
        }
    }
    
    # Random move
    $availableMoves = @()
    for ($i = 0; $i -lt 9; $i++) {
        if ($board[$i] -is [int]) {
            $availableMoves += $i
        }
    }
    if ($availableMoves.Count -gt 0) {
        $move = $availableMoves | Get-Random
        $board[$move] = 'O'
    }
}

# Main game loop
function Play-Game {
    param ($aiProbability)
    
    $playerTurn = $true
    while ($true) {
        Display-Board
        
        if ($playerTurn) {
            $move = Read-Host "Enter your move (1-9)"
            if ($move -match '^\d$' -and $board[$move - 1] -is [int]) {
                $board[$move - 1] = 'X'
                $playerTurn = $false
            } else {
                Write-Host "Invalid move. Try again."
                continue
            }
        } else {
            Write-Host "AI is thinking..."
            Start-Sleep -Seconds 1
            AI-Move -probability $aiProbability
            $playerTurn = $true
        }
        
        if (Check-Win 'X') {
            Display-Board
            Write-Host "You win!"
            break
        } elseif (Check-Win 'O') {
            Display-Board
            Write-Host "AI wins!"
            break
        } elseif (Check-Draw) {
            Display-Board
            Write-Host "It's a draw!"
            break
        }
    }
}

# Set AI winning probability (0-100)
$aiProbability = 50  # Adjust this value to change AI difficulty

# Start the game
Play-Game -aiProbability $aiProbability
