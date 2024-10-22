This Rails project demonstrates how to instrument a Rails application using OpenTelemetry and export traces to Jaeger using Docker for local development. The setup provides powerful observability into your Rails app, allowing you to monitor performance, trace requests, and diagnose bottlenecks in your application.
  
## Prerequisites
- Ruby: 3.3 or higher
- Rails: 8.0.0-beta or higher
- Docker: Installed and running

## Installation
1. Clone the repository
```
git clone https://github.com/hmurtaza7/metrics_explorer
cd metrics_explorer
```
2. Install dependencies

Run the following command to install the necessary gems:
```
bundle install
```
3. Install and Run Jaeger using Docker

Run the following Docker command to start Jaeger locally:
```
docker run --rm --name jaeger \
    -p 6831:6831/udp \
    -p 6832:6832/udp \
    -p 5778:5778 \
    -p 16686:16686 \
    -p 4317:4317 \
    -p 4318:4318 \
    -p 14250:14250 \
    -p 14268:14268 \
    -p 14269:14269 \
    -p 9411:9411 \
    jaegertracing/all-in-one:latest
```
This command runs the Jaeger All-in-One image that exposes the following:  
- Jaeger UI: http://localhost:16686
- OTLP gRPC endpoint: http://localhost:4317
- OTLP HTTP endpoint: http://localhost:14250

4. Configure OpenTelemetry in Rails
OpenTelemetry has already been configured in this project. You can find the configuration in `config/initializers/opentelemetry.rb:`

5. Start the Rails Server

```
rails server
```

Once your server is running, you can access the Rails app at http://localhost:3000.

6. Generate Traces
Send requests to your app by visiting various endpoints in your browser.
These requests will be traced automatically by OpenTelemetry.

7. View Traces in Jaeger
Open the Jaeger UI at http://localhost:16686, and you should be able to see traces for each request you made to your Rails app.
- Select your Rails app `metrics-explorer` from the Service dropdown.
- Click Find Traces to see a list of recent traces.
- Click on a trace to view details, including spans for database queries, external requests, etc.

## Resources
[OpenTelemetry Ruby SDK](https://github.com/open-telemetry/opentelemetry-ruby)
[Jaeger Documentation](https://www.jaegertracing.io/)
  
## License
This project is licensed under the MIT License.
