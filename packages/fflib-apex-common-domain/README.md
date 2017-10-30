# FFLib Apex Common (SObjectDomain)
Package of the SObjectDomain classes from [FFLib Apex Common](https://github.com/financialforcedev/fflib-apex-common)

* [Apex Enterprise Patterns - Domain Layer](https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer)

## Install
In the directory containing your project's `src` directory, run:

```bash
npm install @gonimbly/nimblyci fflib-apex-common-domain
```

Then add to `sfdcDependencies` in `package.json`, eg:

```json
"scripts": {
  "deploy": "nimblyci deploy src",
  "test": "nimblyci test src",
  "add-packages": "nimblyci add-packages"
},
"dependencies": {
  "@gonimbly/nimblyci": "0.0.6",
  "fflib-apex-common-domain": "1.0.0"
},
"sfdcDependencies": ["fflib-apex-common-domain"]
```

## Deployment
In your project, the script `add-packages` will deploy all
packages listed by `sfdcDependencies`:

```bash
SF_LOGIN_URL=https://login.salesforce.com \
SF_USERNAME=<username> \
SF_PASSWORD=<password + security token> \
npm run add-packages
```
