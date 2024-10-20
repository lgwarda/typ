;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex-143-checked-avarage) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
 
; A CTemperature is a Number greater than -273.


; List-of-temperatures -> Number
; computes the average temperature

(check-expect
 (average (cons 1 (cons 2 (cons 3 '())))) 2)
(define (average alot)
  (/ (sum alot) (how-many alot)))

; List-of-temprature -> NumberOrError 
; if the given list is '(), produce an error, otherwise number
(check-expect (checked-avarage (cons 1 (cons 2 (cons 3 '())))) 2)
(check-expect (chacked-average '())
             (error "expect non-empty list..."))

(define (checked-avarage alot)
  (cond [(empty? alot) (error "expect non-empty list...")]
        [else (average alot)]))
 
; List-of-temperatures -> Number 
; adds up the temperatures on the given list
(check-expect (sum (cons 1 (cons 2 (cons 3 '())))) (+ 1 2 3))
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))

 
; List-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 1 (cons 2 (cons 3 '())))) 3)

(define (how-many alot)
  (cond [(empty? alot) 0]
        [else
         (+  (how-many (rest alot)) 1)]))

