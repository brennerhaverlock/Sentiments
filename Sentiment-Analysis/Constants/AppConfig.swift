

struct AppConfig {
    /// The GitHub URL for this project.
    static let gitHubUrl = "https://github.com/kyleweiner/Sentiments"

    struct SentimentAnalysisAPI {
        /// The URL to the sentiment analysis API.
        static let endpoint = "https://api.monkeylearn.com/v3/classifiers/cl_pi3C7JiL/classify/"

        /// The API key.
        static let key = "35f6e912f3fa6abf6222e85fd7d7f86dbe49aef0"
    }
}
