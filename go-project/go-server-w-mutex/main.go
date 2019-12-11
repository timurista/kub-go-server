package imagemaker

import (
	"fmt"
	"log"
	"net/http"
	"imagemaker"
)

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("listening at 8080")
	http.ListenAndServe("localhost:8000", nil)
	imagemaker.getImage()
}

// echoes the http request
func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "%s %s %s\n", r.Method, r.URL, r.Proto)
	for k, v := range r.Header {
		fmt.Fprintf(w, "Header[%q] = %q\n", k, v)
	}
	fmt.Fprintf(w, "Host = %q\n", r.Host)
	fmt.Fprintf(w, "RemoteAddr = %q\n", r.RemoteAddr)
	if err := r.ParseForm(); err != nil {
		log.Print(err)
	}
	for k, v := range r.Form {
		fmt.Fprintf(w, "Form[%q] = %q\n", k, v)
	}
}
