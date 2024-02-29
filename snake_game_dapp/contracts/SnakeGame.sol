// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SnakeGame {
  uint public currentScore=0;
  uint public highScore=0;
  event GameStarted();
  event GameEnded();

  function startGame() public {
    emit GameStarted();
  }

  function endGame() public {
    emit GameEnded();
  }
}
