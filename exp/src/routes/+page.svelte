<script>
	import { onMount } from 'svelte';
	import { defaultEvmStores } from 'svelte-web3';
	defaultEvmStores.setProvider();
	onMount(() => {
		// add a test to return in SSR context
		defaultEvmStores.setProvider();
	});
</script>
