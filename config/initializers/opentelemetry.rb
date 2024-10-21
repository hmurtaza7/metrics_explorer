require "opentelemetry/sdk"
require "opentelemetry/instrumentation/all"

OpenTelemetry::SDK.configure do |c|
  c.service_name = "metrics-explorer"
  c.use_all() # enables all instrumentation!
end
