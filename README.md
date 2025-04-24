# rpn_calc_tests
API testing for RPN Calculator found at https://rpncalc20220128092841.azurewebsites.net/swagger/index.html

Utilizes Cucumber-js and PactumJs

To run, clone the repo and run the following:
```
npm install
npm test
```

To run a specific subset of tests, instead run the following after installation (tags can be found in the .feature files in ./features/):
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
