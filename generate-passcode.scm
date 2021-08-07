#!/home/kraai/.guix-profile/bin/guile \
-e main -s
!#

(use-modules (gcrypt random))
(use-modules (ice-9 format))
(use-modules (ice-9 match))
(use-modules (rnrs bytevectors))

(define (secure-random n)
  (let* ((bits (integer-length n))
	 (bytes (ceiling-quotient bits 8))
	 (result (modulo (bytevector-uint-ref (gen-random-bv bytes) 0 (native-endianness) bytes) (expt 2 bits))))
    (if (< result n)
	result
	(secure-random n))))

(define* (generate-passcode #:optional (length 6))
  (format #f "~v,'0d" length (secure-random (expt 10 length))))

(define (main args)
  (match args
    ((_)
     (display (generate-passcode))
     (newline))
    ((_ n)
     (display (generate-passcode (string->number n)))
     (newline))))
