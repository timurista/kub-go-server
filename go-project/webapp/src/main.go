package main

import (
	"net/http"

	"github.com/russross/blackfriday"
)

func main() {
	println("RUNNING at 8080")
	http.HandleFunc("/markdown", GenerateMarkdown)
	http.Handle("/", http.FileServer(http.Dir("public")))
	http.ListenAndServe(":8080", nil)
}

// GenerateMarkdown generates markdown from request
func GenerateMarkdown(rw http.ResponseWriter, r *http.Request) {
	markdown := blackfriday.MarkdownCommon([]byte(r.FormValue("body")))
	rw.Write(markdown)
}
