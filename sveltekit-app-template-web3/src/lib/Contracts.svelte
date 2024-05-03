<script>
  import {
    defaultEvmStores as evm,
    connected,
    chainId,
    chainData,
    contracts,
    selectedAccount,
    web3,
  } from "svelte-web3";

  const CONTRACT_ADDRESS = "0x4Cf77c1f6b56c406ed6EFBbB52d90EBf652ce60F";
  // const CONTRACT_ADDRESS = "0x52c5463117D7Fca98Cc1568AfeAd0915E070Eb7E";
  import ABI from "../abi.json";
  import { intros } from "svelte/internal";
  evm.attachContract("Test", CONTRACT_ADDRESS, ABI);
  let name;
  let value;
  const GetName = async () => {
    name = await $contracts.Test.methods.name().call();
    console.log(name);
  };
  const Transfer = async () => {
    if (!value || isNaN(value)) {
      alert("Please enter a valid number");
      return;
    }

    const transactionHash = await window.ethereum.request({
      method: "eth_sendTransaction",
      params: [
        {
          from: $selectedAccount,
          to: CONTRACT_ADDRESS,
          value: $web3.utils.toWei(value.toString(), "ether"),
          // Customizable by the user during MetaMask confirmation.
          gasLimit: "0x1028",
          // Customizable by the user during MetaMask confirmation.
          maxPriorityFeePerGas: "0x3b9aca",
          // Customizable by the user during MetaMask confirmation.
          maxFeePerGas: "0x2540be4",
        },
      ],
    });
    $web3.eth.getTransactionReceipt(transactionHash, (err, receipt) => {
      if (err) {
        console.log(err);
        return;
      }
      console.log(receipt);
    });
  };
</script>

<div class="content">
  <h1>svelte-web3</h1>

  <h2>using the '$contracts' store</h2>

  <p>
    The following code initialize the $contracts store with the ERC20 LINK
    Token. Here we use the #await svelte block to load the token totalSupply of
    the contract
  </p>

  <pre><code></code></pre>

  {#if $connected}
    {#if $chainId != 11155111}
      <p>
        Your are connected to the wrong network ("{$chainId}")". Please connect
        to the testnet Sepolia for the $contract store demo
      </p>
    {:else if $contracts.Test}
      <button class="button" on:click={GetName}> Get Name </button>
      {#if name}
        <p>The name of the contract is: {name}</p>
      {/if}
      <p>To get an NFT you must transfer some token to the contract</p>
      <input type="number" bind:value />
      <button class="button" on:click={Transfer}>Send</button>
    {/if}
  {:else}
    <p>
      Please first <a href="/web3/set">connect</a>
      connect to the görli network to be able to use this page.
    </p>
  {/if}
</div>
0x52c5463117D7Fca98Cc1568AfeAd0915E070Eb7E
