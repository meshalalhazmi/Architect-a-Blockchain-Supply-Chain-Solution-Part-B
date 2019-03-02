// migrating the appropriate contracts
var BakerRole = artifacts.require("./BakerRole.sol");
var DeliveryAgentRole = artifacts.require("./DeliveryAgentRole.sol");
var ConsumerRole = artifacts.require("./ConsumerRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(BakerRole);
  deployer.deploy(DeliveryAgentRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};
