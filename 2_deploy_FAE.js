const FunctionsAndErrors = artifacts.require("FunctionsAndErrors");

module.exports = function (deployer) {
  const initialBalance = 100; // replace with any
  
  deployer.deploy(FunctionsAndErrors, initialBalance);
};
