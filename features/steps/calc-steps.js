const { Before, Given, When, Then } = require("@cucumber/cucumber");
const { spec, expect } = require("pactum");
const assert = require('assert')

baseUrl = "https://rpncalc20220128092841.azurewebsites.net"
getStackEndpoint = "/api/RpnCalc/stack";
postPushEndpoint = "/api/RpnCalc/push";
postPopEndpoint = "/api/RpnCalc/pop";
postOperationEndpoint = "/api/RpnCalc/operation"
deleteEndpoint = "/api/RpnCalc"

//// BEFORE hooks

Before(function(){
    this.response = null;
});


//// GIVEN statements

Given("the calc stack is cleared", async function () {
    this.response = await spec()
        .delete(baseUrl + deleteEndpoint)
        .expectStatus(200);
});

Given("the stack is populated with values", async function (dataTable){
    /* Expects table of format:
        | value |
        | 1     |
        | 2     |
        ....
    */
    data = dataTable.rows();
    // console.debug(data[0][0]);
    // console.debug(data[1][0]);
    // console.debug(data.length);
    for(i = 0; i < data.length; i++){
        this.response = await spec()
            .post(baseUrl + postPushEndpoint + "?value=" + data[i][0])
            .expectStatus(200);
    }
});

//// WHEN statements


When("I call GET STACK", async function(){
    
    this.response = await spec()
        .get(baseUrl + getStackEndpoint);
    // console.debug("Result from GET:")
    // console.debug(this.response.body);
});

When("I call PUSH with value \"{double}\"", async function (value){
    this.response = await spec()
        .post(baseUrl + postPushEndpoint + "?value=" + value);
});

When("PENDING: I call PUSH with invalid value \"{string}\"", async function (value){
    //Work out regex to ensure that value is actually invalid
    this.response = await spec()
        .post(baseUrl + postPushEndpoint + "?value=" + value);
});

When("I call POP", async function(){
    this.response = await spec()
        .post(baseUrl + postPopEndpoint);
});

When(/^I call OPERATION (Addition|Subtract|Multiplication|Division)$/, async function (operation){
    this.response = await spec()
        .post(baseUrl + postOperationEndpoint + "?operationType=" + operation);
})

When("I call DELETE", async function(){
    this.response = await spec()
        .delete(baseUrl + deleteEndpoint);
});

//// THEN statements

Then("the response is successful", function (){
    expect(this.response).should.have.status(200);
});

Then("the response has status \"{double}\"", function(status){
    expect(this.response).should.have.status(status);
});

Then("the response is value \"{double}\"", function(value){
    expect(this.response).should.have.body(value);
});

Then("the response is a list with single value \"{double}\"", function (value){
    expectedBody = [value];
    expect(this.response).should.have.jsonMatch([value]);
});

Then(/^the response is a list (containing|not containing) value \"([0-9]+)\"$/, function(containInput, value){
    resultsArr = this.response.body;

    assert(Array.isArray(resultsArr));

    // I would have preferred to use resultsArr.includes(value) for these, but it wasn't working properly. Frustrating.
    // Some sort of typing issue pulling from json? I'm not sure, but this works for now and I want to move on. 
    if(containInput.includes("not")){
        resultsArr.forEach(element => {
            assert.notEqual(element, value)
        });
    }else{
        isFound = false;
        resultsArr.forEach(element => {
            if(element == value)
                isFound = true;
        });
        assert(isFound);
    }
});

Then("the response is a list with values", function (dataTable){
    /* Expects table of format:
        | value |
        | 1     |
        | 2     |
        ....
    */
    data = dataTable.rows();
    assert.equal(this.response.body.length, data.length);

    for(i = 0; i < data.length; i++){
        assert.equal(this.response.body[i], data[i][0]);
    }
});

Then("the response is an empty list", function(){
    expect(this.response).should.have.jsonMatch([]);
});

Then("the response has content-length 0", function(){
    expect(this.response).should.have.headerContains("content-length", "0");
});
