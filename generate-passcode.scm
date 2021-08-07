#!/usr/bin/env -S guile -e main -s
!#

; Copyright 2021 Matthew James Kraai
;
; This file is part of generate-passcode.
;
; generate-passcode is free software: you can redistribute it and/or
; modify it under the terms of the GNU Affero General Public License
; as published by the Free Software Foundation, either version 3 of
; the License, or (at your option) any later version.
;
; generate-passcode is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; Affero General Public License for more details.
;
; You should have received a copy of the GNU Affero General Public
; License along with generate-passcode.  If not, see
; <https://www.gnu.org/licenses/>.

(use-modules (gcrypt random)
	     (ice-9 format)
	     (ice-9 match)
	     (rnrs bytevectors))

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
