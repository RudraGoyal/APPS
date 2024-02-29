const SnakeGame = artifacts.require("SnakeGame");

module.exports = function (deployer) {
  deployer.deploy(SnakeGame);
};