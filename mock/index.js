var mockServerClient = require('mockserver-client').mockServerClient;
mockServerClient("localhost", 1080).mockAnyResponse({
    "httpRequest": {
        "specUrlOrPayload": "file:/Users/jamesbloom/git/mockserver/mockserver/mockserver-core/target/test-classes/org/mockserver/openapi/openapi_petstore_example.json"
    },
    "httpResponse": {
        "body": "some_response_body"
    }
}).then(
    function () {
        console.log("expectation created");
    },
    function (error) {
        console.log(error);
    }
);
