# Dynacover Docker Action

This action runs [erikaheidi/dynacover](https://github.com/erikaheidi/dynacover) to update the Twitter header image
of the account linked through the secret keys that must be previously defined as repository secrets.

## Requirements
You'll need to set up your Twitter API credentials and user tokens using repository secrets, on the same repository
you set up your action workflow.

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
      - uses: erikaheidi/dynacover-actions@v1
        name: 'Update Dynacover image and upload to Twitter'
        env:
          TW_CONSUMER_KEY: ${{ secrets.TW_CONSUMER_KEY}}
          TW_CONSUMER_SECRET: ${{ secrets.TW_CONSUMER_SECRET}}
          TW_USER_TOKEN: ${{ secrets.TW_USER_TOKEN}}
          TW_USER_TOKEN_SECRET: ${{ secrets.TW_USER_TOKEN_SECRET}}
```