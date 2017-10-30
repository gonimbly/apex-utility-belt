# My Example Salesforce Org
An example Salesforce org repo for using unmanaged Apex code published on npm.

## Install dependencies
```bash
npm install
```

## Scripts

### `npm run deploy`
`deploy` deploys all project metadata (under `src/`):

```bash
SF_LOGIN_URL=https://login.salesforce.com \
SF_USERNAME=<username> \
SF_PASSWORD=<password + security token> \
npm run add-packages
```

### `npm run add-packages`
`add-packages` deploys all packages listed by `sfdcDependencies` in the `package.json`:

```bash
SF_LOGIN_URL=https://login.salesforce.com \
SF_USERNAME=<username> \
SF_PASSWORD=<password + security token> \
npm run add-packages
```

## Setting up for an existing repo
1. You will first need to have `npm` installed to your machine, so install the latest
version from [https://nodejs.org](https://nodejs.org).
2. Open your terminal and make your SFDC project the current directory.
3. Init a `package.json` for your project with `npm init` and follow the prompts.
4. Run `npm install nimblyci`. This powers the deployment scripts shown above.
5. Edit the `package.json` and do the following:
    * Set the `private` flag:
      ```json
      "private": true
      ```
    * Update the `scripts` section:
      ```json
      "scripts": {
        "deploy": "nimblyci deploy src",
        "test": "nimblyci test src",
        "add-packages": "nimblyci add-packages"
      }
      ```
    * Then create an `sfdcDependencies` array property:
      ```json
      "sfdcDependencies": [
        "aub-fluent-iterable",
        "fflib-apex-common-domain"
      ]
      ```
6. Now you should be all set to deploy or add some Apex packages like the ones in [Apex Utility Belt](https://github.com/gonimbly/apex-utility-belt)
