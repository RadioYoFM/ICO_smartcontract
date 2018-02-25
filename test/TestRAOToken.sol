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

    function testTimeSealBalanceOf() public {
        RAOToken rao = new RAOToken(proxyOwnerAddress);
        rao.transferToVault(msg.sender,5000);
        Assert.equal(rao.vaultBalanceOf(msg.sender),5000, "The sender didn't receive 5000 RAO in the vault");
    }

    function testTimeSealRemitForAfterExpiry() public {
        RAOToken rao = new RAOToken(this);
        rao.transfer(proxyOwnerAddress,400);
        // Assert.equal(rao.balanceOf(msg.sender))
        Assert.equal(rao.balanceOf(proxyOwnerAddress),400, "The proxy address doesnt have 400 RAO in it");        
        rao.transferToVault(proxyOwnerAddress,5000);
        Assert.equal(rao.balanceOf(proxyOwnerAddress),400, "The proxy address doesnt have 400 RAO in it");
        
        rao.resetTimeSeal();
        rao.remitFor(proxyOwnerAddress);
        Assert.equal(rao.balanceOf(proxyOwnerAddress),5400,"The proxy address didnt receive 5000 RAO from the vault");
    }

    function testTimeSealRemitAfterExpiry() public {
         RAOToken rao = new RAOToken(proxyOwnerAddress);
        // Assert.equal(rao.balanceOf(msg.sender))
        Assert.equal(rao.balanceOf(this),0, "The proxy address doesnt have 0 RAO in it");
        
        rao.transferToVault(this,5000);
        Assert.equal(rao.balanceOf(this),0, "The proxy address doesnt have 0 RAO in it");        
        rao.resetTimeSeal();
        rao.remit();
        Assert.equal(rao.balanceOf(this),5000,"The proxy address didnt receive 5000 RAO from the vault");
    }

    function testWhiteListingByOwner() public {
        RAOToken rao = new RAOToken(proxyOwnerAddress);
        rao.setWhitelistStatus(proxyOwnerAddress,true);
        Assert.equal(rao.whitelisted(proxyOwnerAddress),true, "The proxy address should be whitelisted");        
        
        rao.setWhitelistStatus(this,true);
        Assert.equal(rao.whitelisted(this),true, "The owner address should be whitelisted");        
        
    }




}