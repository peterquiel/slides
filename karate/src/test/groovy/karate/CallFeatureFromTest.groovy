package karate

import com.intuit.karate.Results
import com.intuit.karate.Runner
import org.junit.jupiter.api.Test

class CallFeatureFromTest {

    @Test
    void "calling features"() {

        Results results = new Runner.Builder()
                .path("classpath:karate/purple.feature")
                .parallel(1)

        assert results.getFailCount() == 0
    }


    @Test
    void "calling feature relative to class"() {
        def args = [parameter: "Mr. Pink"]

        def result = Runner.runFeature(getClass(), "java-api.feature", args, false)

        assert result.simpleJson == [foo: 'bar']
        assert result.hello == "Hello Mr. Pink"
    }

}