# rpn_calc_tests
API testing for RPN Calculator found at https://rpncalc20220128092841.azurewebsites.net/swagger/index.html

Utilizes Cucumber-js and PactumJs.

To execute the tests, clone the repo and run the following:
```
npm install
npm test
```
A link to a Cucumber Report will be provided at the end of the run, and a debugging log will be written to `results.txt`.

To execute a specific subset of tests, instead run the following after installation. Tags can be found in the .feature files in `features/`.
```
npm test -- --tags @DesiredTag
```

Endpoints under test include:
```
GET ​/api​/RpnCalc​/stack
POST ​/api​/RpnCalc​/push
POST ​/api​/RpnCalc​/pop
POST ​/api​/RpnCalc​/operation
DELETE ​/api​/RpnCalc
```
