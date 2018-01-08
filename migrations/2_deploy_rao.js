var RAOToken = artifacts.require("./RAOToken.sol")


module.exports = function(deployer,network,accounts) {

    var ACCOUNT = "" // The mainnet account address


    // currently using the first account as the multisig
    if (network == "develop") {
        console.log("using "+accounts[0])
        deployer.deploy(RAOToken,accounts[0]);
    }
    else {
        deployer.deploy(RAOToken,ACCOUNT)
    }
    
};