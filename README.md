# Dynacover Docker Action

This action runs [erikaheidi/dynacover](https://github.com/erikaheidi/dynacover) to update the Twitter header image
of the account linked through the secret keys that must be previously defined as [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

## Requirements
You'll need to set up your Twitter API credentials and user tokens using [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), on the same repository
you set up your action workflow. The GitHub token is optional, only required if you want to use one of the covers that showcase GitHub Sponsors.

- `TW_CONSUMER_KEY`: your Twitter application consumer key or App Key.
- `TW_CONSUMER_SECRET`: your Twitter application consumer secret or App Secret.
- `TW_USER_TOKEN`: your personal user token.
- `TW_USER_TOKEN_SECRET`: your personal user token secret.
- `GITHUB_TOKEN` (optional): your GitHub personal token (for pulling GitHub Sponsors).

For more information, check [this tutorial](https://dev.to/erikaheidi/how-to-dynamically-update-twitter-cover-image-to-show-latest-followers-using-php-gd-and-twitteroauth-62n).

## Inputs

## `template`

**Optional** The template you want to use. Default is `app/Resources/templates/cover_basic.json`.

## Outputs

## `response`

The output from the command.

## Example usage

```yml
name: Update Twitter Header Image with Dynacover
on:
  schedule:
    - cron: "0 * * * *"
  workflow_dispatch:
jobs:
  main:
    runs-on: ubuntu-latest
    steps:
      - uses: erikaheidi/dynacover-actions@v3
        name: 'Update Dynacover image and upload to Twitter'
        env:
          TW_CONSUMER_KEY: ${{ secrets.TW_CONSUMER_KEY}}
          TW_CONSUMER_SECRET: ${{ secrets.TW_CONSUMER_SECRET}}
          TW_USER_TOKEN: ${{ secrets.TW_USER_TOKEN}}
          TW_USER_TOKEN_SECRET: ${{ secrets.TW_USER_TOKEN_SECRET}}
```