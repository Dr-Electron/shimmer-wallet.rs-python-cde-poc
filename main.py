from iota_wallet import IotaWallet, StrongholdSecretManager

# This example checks the balance of an account.

client_options = {
    'nodes': ['https://api.testnet.shimmer.network'],
}

# Shimmer coin type
coin_type = 4219

secret_manager = StrongholdSecretManager("stardust-cli-wallet.stronghold", "password")

wallet = IotaWallet('./stardust-cli-wallet-db', client_options, coin_type, secret_manager)

account = wallet.get_account('Alice')

# Sync account with the node
response = account.sync_account()
print(f'Synced: {response}')

# Just calculate the balance with the known state
balance = account.get_balance()
print(f'Balance: {balance}')