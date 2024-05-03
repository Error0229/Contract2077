<script>
  import { onMount } from "svelte";

  import {
    defaultEvmStores as evm,
    connected,
    web3,
    evmProviderType,
    selectedAccount,
    chainId,
    chainData,
  } from "svelte-web3";

  let type;
  let balance;
  let pending = false;

  const connect = async () => {
    pending = true;
    try {
      const handler = {
        Browser: () => evm.setProvider(),
      };
      await handler[type]();
      pending = false;
    } catch (e) {
      console.log(e);
      pending = false;
    }
  };

  const disconnect = async () => {
    await evm.disconnect();
    pending = false;
  };
  const getBalance = async () => {
    balance = await $web3.eth.getBalance($selectedAccount);
  };
</script>

<div class="content">
  <h1>svelte-web3</h1>

  <h2>using setProvider()</h2>

  {#if !$connected}
    <p>
      Before using any stores, you need to establish a connection to an EVM
      blockchain. Here are a few examples to connect to the provider, RPC or
      others providers. Check the code and the README to learn more.
    </p>

    <p>Choose the provider:</p>

    <button class="button" disabled={pending} on:click={connect}>Connect</button
    >

    <select bind:value={type}>
      <option value="Browser">Browser (window.ethereum)</option>
    </select>

    {#if pending}connecting...{/if}
  {:else}
    <p>
      You are now connected to the blockchain (account {$selectedAccount})
    </p>

    <button class="button" on:click={disconnect}> Disconnect </button>

    <button class="button" on:click={getBalance}> Get Balance </button>

    <h2>Current stores values:</h2>

    <ul>
      <li>$connected: {$connected}</li>
      <li>$chainId: {$chainId}</li>
      <li>$evmProviderType: {$evmProviderType}</li>
      <li>$selectedAccount: {$selectedAccount}</li>
      <li>$chainData: {$chainData.name}</li>
      {#if balance}
        <li>Balance: {balance}</li>
      {/if}
    </ul>
  {/if}
</div>

<style>
  select {
    margin-top: 1em;
    padding: 0.5em;
    font-size: 80%;
  }

  ul li {
    list-style: none;
    text-align: left;
  }

  ul li:before {
    content: "=> ";
  }
</style>
