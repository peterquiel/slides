function fn () {

    var env = karate.env;
    if (env === undefined) {
        env = "localhost";
    }

    var config = {test: "super"}

    if(env == 'localhost') {
        config.baseUrls = {
            wireMock : '"http://localhost:8080/"'
        }
    };

    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 5000);
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    karate.configure('retry', { count: 5, interval: 1000 });
    karate.configure('report', { showLog: true, showAllSteps: false });

    return config;
}