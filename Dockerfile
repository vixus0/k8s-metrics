from golang:1.16-alpine as build
workdir /opt/build

copy go.mod go.sum /opt/build/
run go mod download

copy main.go .
run export CGO_ENABLED=0 \
 && go build

from scratch as run
copy --from=build /opt/build/k8s-metrics /k8s-metrics

expose 8090
entrypoint ["/k8s-metrics"]
