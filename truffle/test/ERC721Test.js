const ERC721 = artifacts.require("ERC721");
contract('ERC721', (accounts) => {
    it('should have 0 in the first account', async () => {
        const instance = await ERC721.deployed();
        const balance = await instance.balanceOf.call(accounts[0]);
        assert.equal(balance.valueOf(), 0);
    });
    it('should be able to mint tokens', async () => {
        const instance = await ERC721.deployed();
        await instance.mint(accounts[0], 1);
        const balance = await instance.balanceOf.call(accounts[0]);
        assert.equal(balance.valueOf(), 1);
    });
    it('should be able to transfer tokens', async () => {
        const instance = await ERC721.deployed();
        await instance.transferFrom(accounts[0], accounts[1], 1);
        const balance = await instance.balanceOf.call(accounts[1]);
        assert.equal(balance.valueOf(), 1);
    });
});
