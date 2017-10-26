# Visuell regressiontestning i praktiken

As described at https://labs.sparebank1.no/2017/10/09/visuell-regressiontestning-i-praktiken/


## init

```
$ npm install
```

## files

* html document under test: [./htdocs/](htdocs).
* test suites: [./visual-tests/specs/](visual-tests/specs).
* baseline screen shots: [./visual-tests/screens/](visual-tests/screens).
* test report ./gemini-report/ (not under version control).

## run visual tests

```
$ npm test
```

## update baseline images

```
$ npm run update
```
