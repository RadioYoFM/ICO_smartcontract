pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RAOToken.sol";

contract TestRAOToken {
    uint public initialBalance = 10 ether;
    address public proxyOwnerAddress = address(0x833Fb0e2bA980B64B8f314f9dB6d0F0E98BA0Da4); // a proxy owner address for testing coin sales and stuff

    function testInitialSupply() public {
        RAOToken rao = new RAOToken(msg.sender);
        uint expected = 33000000000000000000000000;
        Assert.equal(rao.totalSupply(), expected, "The total supply should be 33000000000000000000000000 RAO tokens");
    }

    function testOwnerBalance() public {
        RAOToken rao = new RAOToken(msg.sender);
        Assert.equal(rao.balanceOf(msg.sender),rao.totalSupply(),"The multisig should have all the balance");

    }

    function testSetRate() public {
        RAOToken rao = new RAOToken(msg.sender);
        uint rate = 500e18;
        rao.changeTokenRate(rate);
        Assert.equal(rao.getRate(),rate,"The rate should be set to 500e18");
    }

    function testBurnAll() public {
        RAOToken rao = new RAOToken(msg.sender);
        rao.burn(rao.totalSupply());
        Assert.equal(rao.totalSupply(),0,"The supply should become 0");
        Assert.equal(rao.balanceOf(msg.sender),0,"The multisig balance should be 0");
    }

}