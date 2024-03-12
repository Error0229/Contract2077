const ERC20 = artifacts.require('ERC20');
contract('ERC20', (accounts) => {
    it('should have 42000000 in the first account', async () => {
        const instance = await ERC20.deployed();
        const balance = await instance.balanceOf.call(accounts[0]);
        assert.equal(balance.valueOf(), 42000000);
    });  

    it('should be able to transfer tokens', async () => {
        const instance = await ERC20.deployed();
        await instance.transfer(accounts[1], 1000);
        const balance = await instance.balanceOf.call(accounts[1]);
        assert.equal(balance.valueOf(), 1000);
    });

    it('should be able to approve tokens', async () => {
        const instance = await ERC20.deployed();
        await instance.approve(accounts[1], 1000);
        const allowance = await instance.allowance.call(accounts[0], accounts[1]);
        assert.equal(allowance.valueOf(), 1000);
    });
    it('should be able to transferFrom tokens', async () => {
        const instance = await ERC20.deployed();
        await instance.transferFrom(accounts[0], accounts[2], 1000, {from: accounts[1]});
        const balance = await instance.balanceOf.call(accounts[2]);
        assert.equal(balance.valueOf(), 1000);
    });

}); 
