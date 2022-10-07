# Dynacover Action

[Dynacover](https://github.com/erikaheidi/dynacover) is a CLI application that dynamically generates Twitter header images showcasing your latest followers and/or GitHub Sponsors. 
This action runs Dynacover to update the Twitter header image
of the account linked through the secret keys that must be previously defined as [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

Please refer to [erikaheidi/dynacover](https://github.com/erikaheidi/dynacover) for more details on how Dynacover works, what are the customization options, and how to create custom templates.

## Requirements
You'll need to set up your Twitter API credentials and user tokens using [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), on the same repository
you set up your action workflow. The GitHub token is optional, only required if you want to use one of the covers that showcase GitHub Sponsors.

**Secrets**
- `DYNA_TWITTER_KEY`: your Twitter application consumer key or App Key.
- `DYNA_TWITTER_SECRET`: your Twitter application consumer secret or App Secret.
- `DYNA_TWITTER_TOKEN`: your personal user token.
- `DYNA_TWITTER_TOKEN_SECRET`: your personal user token secret.
- `DYNA_GITHUB_TOKEN` (optional): your GitHub personal token (for pulling GitHub Sponsors).

For more information, check [this tutorial](https://dev.to/erikaheidi/how-to-dynamically-update-twitter-cover-image-to-show-latest-followers-using-php-gd-and-twitteroauth-62n).

### Customizing Template and Images

You can fully customize the design of your banner. In order to do that, you'll need to include your custom template and any images you'll use in the repository where the workflow runs. This repository is checked out to a location that can be referenced from your workflow (check the example workflow for more info). 

There are 3 environment variables you can use to set up the location of templates and images, and the default template:

- `DYNA_TEMPLATES_DIR`: path to the default location of templates in your workflow repository.
- `DYNA_IMAGES_DIR`: path to the default location of images referenced by your template, in your workflow repository.
- `DYNA_DEFAULT_TEMPLATE`: name of your custom template relative to `DYNA_TEMPLATES_DIR`.

For a real life example of how you can organize these files within your workflow, check the repository [erikaheidi/github-actions](https://github.com/erikaheidi/github-actions) where I have my own Dynacover set up.

## Inputs

## `template`

**Optional** The template you want to use. Default is `cover_basic.json`.

## Outputs

## `response`

The output from the command.

## Example usage

The following example will set up a workflow to run once every hour. 

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
      - uses: actions/checkout@v2
        with:
          path: 'dynacover_custom'
      - name: 'Update Dynacover image and upload to Twitter'
        uses: erikaheidi/dynacover-actions@v4.2.3
        env:
          # Uncomment and change accordingly to customize your cover
          #DYNA_DEFAULT_TEMPLATE: dynacover.json
          #DYNA_TEMPLATES_DIR: ${{ github.workspace }}/dynacover_custom
          #DYNA_IMAGES_DIR: ${{ github.workspace }}/dynacover_custom
          DYNA_TWITTER_KEY: ${{ secrets.DYNA_TWITTER_KEY }}
          DYNA_TWITTER_SECRET: ${{ secrets.DYNA_TWITTER_SECRET }}
          DYNA_TWITTER_TOKEN: ${{ secrets.DYNA_TWITTER_TOKEN }}
          DYNA_TWITTER_TOKEN_SECRET: ${{ secrets.DYNA_TWITTER_TOKEN_SECRET }}
          DYNA_GITHUB_TOKEN: ${{ secrets.DYNA_GITHUB_TOKEN }}
```
