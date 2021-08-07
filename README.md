I wanted to generate a passcode for my iPhone; I also wanted to learn
a little more about [Guile](https://www.gnu.org/software/guile/).
This program is the result.  If you have suggestions as to how I can
improve it, please let me know.  I'm new to Guile, so I'm pretty sure
I'm doing it wrong.

# Usage

1. Install [Guile](https://www.gnu.org/software/guile/) and
   [guile-gcrypt](https://notabug.org/cwebber/guile-gcrypt).
2. Run `generate-passcode.scm`.  If you pass it an argument (e.g.,
   `generate-passcode.scm 4`), it will generate a passcode of that
   length instead of the default length (i.e., 6).
