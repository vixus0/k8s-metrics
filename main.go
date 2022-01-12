package main

import (
	"fmt"
	"net/http"

	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func handleRoot(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "mmm nom nom nom\n")
}

func main() {
	http.HandleFunc("/", handleRoot)
	http.Handle("/metrics", promhttp.Handler())
	http.ListenAndServe(":8090", nil)
}
