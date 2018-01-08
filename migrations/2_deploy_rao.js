var RAOToken = artifacts.require("./RAOToken.sol")


module.exports = function(deployer,network,accounts) {

    var ACCOUNT = ""; // The mainnet account address


    // currently using the first account as the multisig
    if (network == "develop") {
        console.log("using "+accounts[0]);
        deployer.deploy(RAOToken,accounts[0]);
    }
    else if (network == "rinkeby") {  // using rinkeby for integration tests
        // for now using the first account
        deployer.deploy(RAOToken,accounts[0]);
    }
    
};