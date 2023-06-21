# Github Action to validate Packer templates

This Github Action will only run the `validate` command from Packer. The main difference regarding other actions (as far as I have checked) is that this action considers setups based on newer versions of Packer. For example, this action offers the option of running `packer init` (command that installs any needed plugins) before validating the template.

## Inputs

- `run_init`: Indicates if it is necessary to run the `packer init` command before the validation. This is necessary when using plugins. No value is defined, so any value is valid 
- `args`: Arguments to use with the `validate` command. For example, adding a variables file or to only perform a syntax check.
- `templates_path` (required): Path where the templates are located.

## Workflow Example

```
name: Packer template validation

on:
  pull_request:
    branch:
    - main

jobs:
  run_validation:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: wolfangaukang/packer-validate-template@main
      with:
        run_init: true
        args: -var-file templates/var_files/ubuntu.pkrvars.hcl
        templates_path: templates/amazon-ebs.pkr.hcl
```
