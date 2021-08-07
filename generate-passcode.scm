#!/home/kraai/.guix-profile/bin/guile \
-e main -s
!#

(use-modules (gcrypt random))
(use-modules (rnrs bytevectors))

(define (generate-passcode)
  (let ((number (modulo (bytevector-u32-ref (gen-random-bv 4) 0 (endianness little)) (expt 2 20))))
    (if (<= number 999999)
	(let ((digits (number->string number)))
	  (string-append (make-string (- 6 (string-length digits)) #\0) digits))
	(generate-passcode))))

(define (main args)
  (display (generate-passcode))
  (newline))
