#!/usr/bin/env -S guile -e main -s
!#

(use-modules (gcrypt random))
(use-modules (ice-9 format))
(use-modules (ice-9 match))
(use-modules (rnrs bytevectors))

(define (secure-random n)
  "Return a secure number in [0, N).

Accepts a positive integer and returns a number between
zero (inclusive) and N (exclusive). The values returned have a uniform
distribution."
  (let* ((bits (integer-length n))
	 (bytes (ceiling-quotient bits 8))
	 (result (modulo (bytevector-uint-ref (gen-random-bv bytes) 0 (native-endianness) bytes) (expt 2 bits))))
    (if (< result n)
	result
	(secure-random n))))

(define* (generate-passcode #:optional (length 6))
  "Return a secure passcode of LENGTH digits."
  (format #f "~v,'0d" length (secure-random (expt 10 length))))

(define (main args)
  (let ((passcode
	 (match args
	   ((_) (generate-passcode))
	   ((_ n) (generate-passcode (string->number n))))))
    (display passcode)
    (newline)))
