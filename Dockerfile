FROM golang:alpine AS builder

WORKDIR /challenge

ADD main.go .

RUN go build main.go

FROM scratch

COPY --from=builder /challenge/main .

ENTRYPOINT ["./main"]