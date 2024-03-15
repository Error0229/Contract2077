const ERC20 = artifacts.require("ERC20");

module.exports = function (deployer) {
  deployer.deploy(ERC20, "Racoon coin", "RTC", 10, 42000000);
};
