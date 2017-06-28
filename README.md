# restapi
Wraps the implementation for a REST API written in Go, using Swagger for documentation and stub API generation.

The scope of this repository is to serve as a resource for REST APIs implementations.

## GO with the flow:

You can define your API specification by accessing the swagger-editor at http://127.0.0.1:8081. There, you can also import the `swagger.yml` file located at `swagger/spec/swagger.yml`.

To serve the API documentation and generate a new STUB API, just click on *Generate Server*, choose `nodejs` and download the source code to `swagger/stub` in the project root.

After that, you can rebuild the stub API's Docker image with the source code related to the new spec, and restart the container by running `make swagger/start`.

By running the command `make nginx/start` you will start both containers editor (swagger-editor) and stub (stub API in nodejs) behind a `nignx` reverse proxy.

```
http://127.0.0.1:8081                  -> swagger editor
http://127.0.0.1:8080/docs             -> API specification
```

## Available commands:
```
------------------------------------------------------------------------
RESTAPI
------------------------------------------------------------------------
nginx/build                    build nginx image with custom configuration
nginx/start                    start nginx container as reverse proxying for editor and stub api
swagger/build                  build a new stub server image
swagger/editor                 start swagger editor container
swagger/start                  build and start the stub API server
```