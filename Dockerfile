FROM golang:alpine AS builder

WORKDIR /go/app

COPY . .
RUN go build main.go

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app/main"]
