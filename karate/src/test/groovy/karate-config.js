function fn () {

    var env = karate.env;
    if (env === undefined) {
        env = "localhost";
    }

    var config = {
        baseUrls: {
            // Ok, this both don't differ, but this ma
            localhost: "https://jsonplaceholder.typicode.com",
            develop: "https://jsonplaceholder.typicode.com"
        }
    };

    return config;
}