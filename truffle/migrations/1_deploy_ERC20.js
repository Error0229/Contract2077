const ERC20 = artifacts.require("ERC20");

module.exports = function(deployer) {
  deployer.deploy(ERC20, "🦝", "RTC", 10, 42000000);
};
